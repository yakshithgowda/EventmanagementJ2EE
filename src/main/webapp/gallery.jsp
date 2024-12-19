<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery Collage</title>
<!--     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

 -->    
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 	
 	<style>
        .gallery-item {
            position: relative;
            overflow: hidden;
            margin-bottom: 15px;

        }
        .gallery-img {
            transition: transform 0.5s ease;
            width: 100%;
            height: auto;
            display: block;
        }
        .gallery-item:hover .gallery-img {
            transform: scale(1.1);
        }
    </style>
    
</head>
<body>
	<%@ include file="Header.jsp" %>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1611106211090-8f3c79eb8552?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW5kaWFuJTIwd2VkZGluZ3xlbnwwfHwwfHx8MA%3D%3D" class="gallery-img" alt="Image 1">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1607190074257-dd4b7af0309f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHdlZGRpbmd8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 2">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1587271315307-eaebc181c749?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGluZGlhbiUyMHdlZGRpbmd8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1544592732-83bbbfc46783?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fHdlZGRpbmd8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1634837248818-27b6c3f2b683?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fGJpcnRoZGF5JTIwcGFydHl8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1707593395867-c6a0e881ed17?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVuZ2FnZW1lbnQlMjBjZXJlbW9ueXxlbnwwfHwwfHx8MA%3D%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1630526720753-aa4e71acf67d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW5kaWFuJTIwd2VkZGluZ3xlbnwwfHwwfHx8MA%3D%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1600685912448-8bc35c141e18?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fGluZGlhbiUyMHdlZGRpbmd8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/flagged/photo-1571275460369-dc7c65c85082?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmFieSUyMGJpcnRoZGF5fGVufDB8fDB8fHww" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1597157639073-69284dc0fdaf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwd2VkZGluZ3xlbnwwfHwwfHx8MA%3D%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://plus.unsplash.com/premium_photo-1682092021551-c3d981d5f979?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGhhbGRpJTIwY2VyZW1vbnl8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1681717166714-7203160be156?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGhhbGRpJTIwY2VyZW1vbnl8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1587271636175-90d58cdad458?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGluZGlhbiUyMHdlZGRpbmd8ZW58MHx8MHx8fDA%3D" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1511285560929-80b456fea0bc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTk2fHxpbmRpYW4lMjB3ZWRkaW5nfGVufDB8fDB8fHww" class="gallery-img" alt="Image 3">
            </div>
            <div class="col-md-4 col-sm-6 col-12 gallery-item">
                <img src="https://images.unsplash.com/photo-1563521940479-140e6e311385?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzR8VFdYbUtUN2tZRTB8fGVufDB8fHx8fA%3D%3D" class="gallery-img" alt="Image 3">
            </div>
            
            
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>