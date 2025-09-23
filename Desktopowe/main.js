const { app, BrowserWindow, dialog, ipcMain } = require('electron');
const path = require('path');
const { pathToFileURL } = require('url');

/** @type {BrowserWindow | null} */
let mainWindow = null;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 900,
    height: 600,
    minWidth: 600,
    minHeight: 400,
    title: 'odtwarzacz-mp3',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: false,
      contextIsolation: true,
      sandbox: true
    }
  });

  mainWindow.removeMenu?.();
  mainWindow.loadFile(path.join(__dirname, 'index.html'));

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

ipcMain.handle('dialog:openMp3', async () => {
  const result = await dialog.showOpenDialog(mainWindow, {
    title: 'Wybierz plik MP3',
    properties: ['openFile'],
    filters: [
      { name: 'Pliki MP3', extensions: ['mp3'] },
      { name: 'Wszystkie pliki', extensions: ['*'] }
    ]
  });

  if (result.canceled || !result.filePaths?.length) {
    return null;
  }

  const filePath = result.filePaths[0];
  const fileUrl = pathToFileURL(filePath).toString();
  return { filePath, fileUrl };
});

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
