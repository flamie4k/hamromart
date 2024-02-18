<?php
 //iclude user header file
 include 'user_header.php';
?>
<?php 
/*
// Establish connection to MySQL database using mysqli instead of mysql (deprecated)
$connect = mysqli_connect("localhost", "root", "", "hamro_mart");

// Check if connection is successful
if (!$connect) {
    die("Connection failed: " . mysqli_connect_error());
}

$output = '';

// Check if the "query" parameter is set in the POST request
if(isset($_POST["query"])) {
    // Sanitize the input to prevent SQL injection
    $searchQuery = mysqli_real_escape_string($connect, $_POST["query"]);

    // Construct the SQL query with a placeholder
    $query = "SELECT * FROM products WHERE name LIKE '%$searchQuery%'";

    // Execute the SQL query
    $result = mysqli_query($connect, $query);

    // Start building the output HTML
    $output .= '<ul class="list-unstyled">';

    // Check if there are any rows returned by the query
    if(mysqli_num_rows($result) > 0) {
        // Fetch rows and add them to the output HTML
        while($row = mysqli_fetch_array($result)) {
            $output .= '<li>' . $row["name"] . '</li>';
        }
    } else {
        // If no rows are found, display "Item not found"
        $output .= '<li>Item not found</li>';
    }

    // Close the unordered list
    $output .= '</ul>';

    // Output the final HTML
    echo $output;
}
// Close the database connection
mysqli_close($connect);
*/
?>
 <?php 
     //if clicked add to cart button  and assingning input value
     if(isset($_POST['addcart'])){
      $product_name=$_POST['product_name'];
      $product_price=$_POST['product_price'];
      $product_quantity=$_POST['quantity'];
      $product_name=$_POST['product_name'];
      $product_image=$_POST['product_image'];
      //execute query for the slect all item of cart where product name and user_id ids match
       $check_cart_number=mysqli_query($conn,"SELECT * FROM `cart` WHERE name='$product_name' AND user_id='$user_id'") or die('query failed');

       if(mysqli_num_rows($check_cart_number)>0){
       // if the same details row is already in table
         $messgae[]= 'prodduct alrady added';

       }
       else{
        //execute query for the isert cart values or details
        mysqli_query($conn,"INSERT INTO `cart`(user_id,name,price,quantity,image) 
        VALUES('$user_id','$product_name','$product_price','$product_quantity','$product_image')") or die('query failed!');
        $message[]='product added successfully';
        //redirect in index.php page
        header('location:index.php');
       }
     }
 ?>


<?php
// print message
   if(isset($message)){
       foreach($message as $message){
          echo'<div class="form" style="color:green"> <span>'.$message.'</span>
          <img src="./assets/icons/close.png" onclick="this.parentElement.remove();">
             </div>';
                        
       }
   }
?>

<section>
    <div class="banner">
      <img src="./assets/sliders/slider3.jpg" alt="">
    </div>
</section>  
<!--products section-->
<section id="products">
    <h2>Our Products</h2>
    <div class="products">
          
       
              <?php 
                //execute query for select the all details of products
                 $select_products=mysqli_query($conn,"SELECT * FROM `products`") or die('query failed!');
                 if(mysqli_num_rows($select_products)>0){
                  //if product row greaterthan 0
                     while($fetch_products=mysqli_fetch_assoc($select_products)){

                
              ?>    
                <!--fetch product details and make the detals as input-->
                 <div class="product-details">
                    <form action="" method="post" enctype="multipart/form-data">
                    <img src="./uploaded_img./<?php echo $fetch_products['image']; ?>" alt="" class="image">
                    <h4><?php echo $fetch_products['name']; ?></h4>
                    <p>Rs. <?php echo $fetch_products['price']; ?>/-</p>
                    <input type="hidden" name="product_name" value="<?php echo $fetch_products['name']; ?>">
                    <input type="hidden" name="product_price" value="  <?php echo $fetch_products['price']; ?>">
                    <input type="hidden" name="product_image" value="<?php echo $fetch_products['image'];?>">
                    <span>Quantity:</span><input type="number" name="quantity" min="1" value="1">
                      <div class="button">
                      <input style="width:90px" type="submit" value="Add to cart" name="addcart" class="add-to-cart">
                      </div>
                    </form>
                </div>
              <?php 
                     }
                      }
                 else{
                        echo 'No product available !';
                    }
              ?>
    </div>
       
</section>

<?php
//include user_footer.php file
 include 'user_footer.php';
 ?>