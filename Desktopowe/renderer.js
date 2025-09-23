const openBtn = document.getElementById('btn-open');
const playBtn = document.getElementById('btn-play');
const stopBtn = document.getElementById('btn-stop');
const fileNameEl = document.getElementById('file-name');
const statusEl = document.getElementById('status');
const progressEl = document.getElementById('progress');
const timeEl = document.getElementById('time');
const playlistEl = document.getElementById('playlist');

const audio = new Audio();
audio.preload = 'metadata';

audio.addEventListener('loadedmetadata', () => {
  timeEl.textContent = `00:00 / ${formatTime(audio.duration)}`;
});

let loaded = false;

function setUiState() {
  playBtn.disabled = !loaded;
  stopBtn.disabled = !loaded;
  statusEl.textContent = loaded ? 'Gotowe do odtwarzania' : 'Nie wybrano pliku';
}

function formatTime(sec) {
  if (!isFinite(sec)) return '00:00';
  const m = Math.floor(sec / 60);
  const s = Math.floor(sec % 60);
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
}

openBtn.addEventListener('click', async () => {
  const selection = await window.mp3Api.selectFile();
  if (!selection) return;
  const { fileUrl, filePath } = selection;
  audio.src = fileUrl;
  try {
    await audio.load();
  } catch (_) {}
  fileNameEl.textContent = filePath.split(/[\/\\]/).pop() || 'wybrany plik';
  loaded = true;
  setUiState();
});

playBtn.addEventListener('click', async () => {
  if (!loaded) return;
  try {
    await audio.play();
    statusEl.textContent = 'Odtwarzanie...';
  } catch (err) {
    statusEl.textContent = 'Błąd odtwarzania';
    console.error(err);
  }
});

stopBtn.addEventListener('click', () => {
  if (!loaded) return;
  audio.pause();
  audio.currentTime = 0;
  statusEl.textContent = 'Zatrzymano';
});

audio.addEventListener('timeupdate', () => {
  if (!isFinite(audio.duration) || audio.duration <= 0) return;
  const ratio = audio.currentTime / audio.duration;
  progressEl.style.width = `${Math.max(0, Math.min(1, ratio)) * 100}%`;
  timeEl.textContent = `${formatTime(audio.currentTime)} / ${formatTime(audio.duration)}`;
});

audio.addEventListener('ended', () => {
  audio.currentTime = 0;
  statusEl.textContent = 'Zakończono odtwarzanie';
});

setUiState();

if (playlistEl) {
  playlistEl.addEventListener('click', async (e) => {
    const li = /** @type {HTMLElement|null} */ (e.target.closest('li'));
    if (!li) return;
    const rel = li.getAttribute('data-src');
    if (!rel) return;

    audio.src = rel;
    loaded = true;
    setUiState();
    fileNameEl.textContent = rel.split('/').pop() || rel;
    try {
      await audio.play();
      statusEl.textContent = 'Odtwarzanie...';
    } catch (err) {
      statusEl.textContent = 'Błąd odtwarzania (to mogą być placeholdery)';
      console.error(err);
    }
  });
}
