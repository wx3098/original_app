const callAudio = document.getElementById('call_audio');
const callBtn = document.getElementById('call-btn');

callBtn.addEventListener('click', () => {
  
  callAudio.play();

  
  console.log('呼び出しボタンがクリックされました');
});