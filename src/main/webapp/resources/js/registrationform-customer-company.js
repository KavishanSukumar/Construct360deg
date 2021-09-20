                 const actualBtn = document.getElementById('actual-btn');

                  const fileChosen1 = document.getElementById('file-chosen');

                  actualBtn.addEventListener('change', function(){
                 fileChosen.textContent = this.files[0].name
                })