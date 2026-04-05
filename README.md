# 🎵 YouTube Vocal Remover (Local Tool)

Download audio from YouTube, remove vocals using Demucs, trim audio, and export clean WAV files — all locally on your PC.

---

## 🚀 Features

* 🎥 Download audio from YouTube links
* 🎤 Remove vocals using Demucs AI
* ✂️ Optional trimming (start & end time)
* 🔇 Automatic silence removal (beginning & end)
* 💾 Outputs high-quality WAV files
* 🔁 Batch processing (multiple links one after another)
* ⚡ Works fully offline after download (processing is local)

---

## 🧠 How It Works

1. Paste a YouTube URL
2. Tool downloads audio (`yt-dlp`)
3. Removes vocals (`demucs`)
4. Cleans audio (`ffmpeg`)
5. Saves final output:

```text
SongName_no_vocals.wav
```

---

## 📦 Requirements

### 🔹 Python

* Python **3.10 or 3.11 recommended**

---

### 🔹 Python Packages

Install:

```bash
pip install -r requirements.txt
```

---

### 🔹 External Tools (IMPORTANT)

You must install these manually:

---

### 1. Demucs

```bash
pip install demucs
```

---

### 2. PyTorch (Required by Demucs)

CPU version:

```bash
pip install torch torchaudio
```

👉 For GPU: install from official PyTorch website

---

### 3. FFmpeg

Download from:
https://ffmpeg.org/download.html

Place inside project:

```text
ffmpeg/bin/ffmpeg.exe
```

---

### 4. yt-dlp

Download from:
https://github.com/yt-dlp/yt-dlp/releases

Place in project root:

```text
yt-dlp.exe
```

---

## 📁 Project Structure

```text
YouTubeTools/
│
├── run.bat
├── requirements.txt
├── .gitignore
├── README.md
│
├── yt-dlp.exe
├── ffmpeg/
├── demucs_ext/   (virtual environment)
│
├── models/       (auto-downloaded by demucs)
```

---

## ⚙️ Setup

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/yourrepo.git
cd yourrepo
```

---

### 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

---

### 3. (Optional) Activate Virtual Environment

```bash
demucs_ext\Scripts\activate
```

---

## ▶️ How to Run

### Run the script:

```bash
run.bat
```

---

## 📥 Usage

After running, you will see:

```
Paste YouTube URL:
Enter start time (hh:mm:ss) or press Enter:
Enter end time (hh:mm:ss) or press Enter:
```

---

### ✅ Example 1 (Full audio)

```
https://youtube.com/xyz
```

---

### ✂️ Example 2 (Trimmed)

```
https://youtube.com/xyz
Start: 00:00:10
End:   00:01:30
```

---

## 📤 Output

The final file will be saved as:

```text
SongName_no_vocals.wav
```

---

## 🔄 Batch Usage

After finishing one file, the script will ask again:

```
Paste YouTube URL:
```

👉 You can process multiple songs continuously

To exit:

```
exit
```

---

## ⚠️ Important Notes

* 💻 Your PC must stay ON during processing
* 🌐 Internet required for downloading
* ⚡ Processing speed depends on CPU/GPU
* 💾 External hard drive works perfectly
* 📦 First run may download model files (Demucs)

---

## 🐛 Common Issues

### ❌ Script closes immediately

* Run from Command Prompt instead of double-click

---

### ❌ yt-dlp error

Update:

```bash
yt-dlp -U
```

---

### ❌ Demucs error

Reinstall:

```bash
pip install demucs
```

---

### ❌ FFmpeg not found

Check this path exists:

```text
ffmpeg/bin/ffmpeg.exe
```

---

### ❌ No output file

* Check if:

```text
separated/htdemucs/input/no_vocals.wav
```

exists before processing

---

## 🔥 Future Improvements

* 🎶 Automatic chorus detection (AI)
* 🎧 MP3 export option
* 📊 Progress display
* 🖥️ GUI version

---

## 📜 License

MIT License

---

## ⭐ Support

If you find this useful, give it a ⭐ on GitHub!
