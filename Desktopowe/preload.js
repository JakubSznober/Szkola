const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('mp3Api', {
  selectFile: () => ipcRenderer.invoke('dialog:openMp3')
});
