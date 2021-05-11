function post (){
  const submit = document.getElementById("comment-submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("comment-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const movie = gon.movie;
    XHR.open("POST",  `/movies/${movie.id}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const good = document.getElementById("comment-block-good");
      const bad = document.getElementById("comment-block-bad");
      const other = document.getElementById("comment-block-other");
      const formText = document.getElementById("comment-in");
      const formGenre = document.getElementById("genre-select");
      const user=gon.user
      const item = XHR.response.comment;
      const html = `
        <p> 
          <strong> ${user}：</strong>
          ${item.text}
        </p>`;

      if (item.genre_id==2) {
        good.insertAdjacentHTML("beforeend", html);
      } else if (item.genre_id==3) {
        bad.insertAdjacentHTML("beforeend", html);
      } else if (item.genre_id==4){
        other.insertAdjacentHTML("beforeend", html);
      } ;
      formText.value = "";
      formGenre.value = "1";
      
    };
  });
 }
 
 window.addEventListener('load', post);


