<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>

<!-- Font Awesome -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    rel="stylesheet"
    />
<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
    />
<!-- MDB -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
    rel="stylesheet"
    />

<!-- MDB -->
<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>

<script src="https://kit.fontawesome.com/5a5f994da7.js" crossorigin="anonymous"></script>

<!-- CKeditor -->
<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>

<link rel="stylesheet" href="css/home.css">
<style>
    body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
  
  header {
    position: sticky;
    top: 0;
    background-color: #f8f8f8;
    padding: 1px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1;
  }
  
  .navbar {
    position: relative;
    display: flex;
     justify-content: space-between; 
    align-items: center;
  }
  
  .logo a, .logo a:hover{
      color: black;
      text-decoration: none;
  }
  
  .sidebar-button {
    background: none;
    border: none;
    font-size: 18px;
    cursor: pointer;
  }
  
  .logo {
/*     position: absolute;
    top: 4px;
    left: 43%; 
    margin: 0;*/
    color: black;
    text-decoration: none;
    margin-left: 36%;
    font-size: 24px;
  }
  
  .navigation {
    list-style: none;
    margin: 0;
    margin-top: 10px;
    padding: 0;
    display: flex;
  }
  
  .navigation li {
    margin-right: 10px;
  }
  
  .navigation li a {
    text-decoration: none;
    color: #333;
    padding: 5px;
  }
  
  .sidebar {
    width: 250px;
    background-color: #f2f2f2;
    height: 100vh;
    position: fixed;
    top: 0;
    left: -250px;
    transition: left 0.3s ease;
  }
  
  .sidebar-button.open {
    left: 0;
  }
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

.sidebar {
  z-index: 1;
  transition: left 0.3s ease;
}

.sidebar.open {
  left: 0;
}

.close-button {
  background: none;
  border: none;
  font-size: 18px;
  cursor: pointer;
  position: absolute;
  top: 10px;
  right: 10px;
  color: #333;
}

.header-link {
  margin-left: 15%;
  display: flex;
}

.cart-button {
  background-color: #d4cbcb;
  color: #333;
  padding: 8px 12px;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.login {
  margin-left: 5px;
  display: flex;
  align-items: center;
}

.login-link {
  text-decoration: none;
  color: #333;
  padding: 8px 12px;
  background-color: #d4cbcb;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.login-link:hover {
  background-color: #ccc;
}

.slider {
  width: 100vw;
  height: 500px;
  overflow: auto;
  position: relative;
  z-index: 0;
}

.slide {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  animation: slideAnimation 12s infinite;
}

.slide a {
  width: 100%;
  height: 100%;
}

.slide img {
  width: 100%;
  height: 100%;

}

.slide:nth-child(1) {
  animation-delay: 0s;
}

.slide:nth-child(2) {
  animation-delay: 4s;
}


@keyframes slideAnimation {
  0% {
    opacity: 0;
  }
  25% {
    opacity: 1;
  }
   33% {
    opacity: 1;
  }
  58% {
    opacity: 0;
  }
  100% {
    opacity: 0;
  } 
}

.category , .recommend-food{
  margin:auto;
  width: 75%;
  display: flex;
  align-items: center;
}

.line {
  flex-grow: 1;
  height: 1px;
  background-color: rgb(206, 202, 202);
  margin-left: 10px;
}

.footer {
/*   position: fixed;
  bottom: 0;
  right:0;
  left:0; */
 margin-top: 380px;
  background-color: #f8f8f8;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: flex-end;
  padding: 20px;
}

.footer h2 {
  margin-bottom: 35px;
}

.footer .links {
  display: flex;
  gap: 10px;
}

.footer .links a {
  text-decoration: none;
  color: #000;
}

.footer p {
  margin: 0;
}



.category-content div , .recFood-content div{
    padding: 0 0 30px 0;
    margin-bottom: 50px;
    margin-left: 30px;
    height: 300px;
    width: 350px;
/*    border: 10px solid rgba(170, 165, 165,0.5);*/
    background-color: #fff;
    box-shadow: 0 5px 4px rgba(0, 0, 0, 0.2);
}

.recFood-content div{
  padding-bottom: 90px;
   
}    

.category-content div h2, .recFood-content div h2 {
  text-align: center;
}

.category-content div img ,.recFood-content div img{
  height: 90%;
  width: 100%;
}

a h2{
  color: black;
  transition: color 0.3s ease;
}

.categoryName:hover , .productName:hover {
    color: black;
    text-decoration: none; 
}

/*a h2:hover {
  color: black;
  text-decoration: none; 
}*/

.sidebar ul li a{
    color: black;
    text-decoration: none;
}

.sidebar ul li a:hover{
    color: black;
    text-decoration: none;
}



.buyNow {
    margin-left: 33%;
    border-radius: 10px;
    padding: 10px 20px;
    background-color: #f0f0f0;
    border: none;
    color: #333;
    font-size: 16px;
}



</style>
