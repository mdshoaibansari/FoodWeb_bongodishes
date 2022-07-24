<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@page
    import="com.wipro.bean.*,com.wipro.Dao.*,com.wipro.Dao.StoreDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie"
    %>

    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Food Items</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

      <!-- Bootstrap CSS v5.0.2 -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <style>
        body {
          min-height: 100vh;
          background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.4)), url("./resources/images/pexels-lukas-616401.jpg");
          background-repeat: no-repeat;
          background-size: cover;
          background-position: 50%;
        }

        .table {
          font-size: 22px;
          color: white;
        }

        h1 {
          color: white;

        }

        h3 {
          color: red;
          background-color: white;


        }

        img {
          width: 120px;
          height: 80px;
        }

        .mycenter {
          margin: auto;
          display: flex;
          justify-content: center;
          align-items: center;
        }
      </style>
      <%@ include file="headerlogout.jsp" %>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body>

      <div class="container">
        <% int storeid=Integer.parseInt(request.getParameter("storeid")); StoreDao sd=new StoreDao(); FoodDao fd=new
          FoodDao(); String storeName=sd.getStoreName(storeid); ArrayList<RelStoreFoodBean> list=
          sd.getAllFood(storeid);


          %>

          <h1 class="text-center mt-2">Manage : <%= storeName %>
          </h1>
          <form id="FoodForm"  method="get">
            <span id="buttonSet">
              <button class="btn btn-danger" type="button" onclick="deleteFood()"> Delete </button>
              <button class="btn btn-info" type="button" id="EditButton" onclick="edit()"> Edit </button>
              <button class="btn btn-md btn-secondary" id="AddButton" type="button" onclick="add()">Add Food</button>
            </span>

            <table id="mytable" class="table  table-hover  mt-3">

              <thead>
                <tr>
                  <th scope="col">Select</th>
                  <th scope="col">Food Name</th>

                  <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Image</th>

                </tr>
              </thead>



              <tbody>
                <% /* PizzaDao pd=new PizzaDao(); ArrayList<PizzaBean> list=pd.getAllFood(); */
                  RelStoreFoodBean rsfb;
                  for(int i=0;i<list.size();i++) { rsfb=list.get(i); %>
                    <tr id="rowid<%= rsfb.getRelationId()%>">
                      <td scope="row"><input type="checkbox" name="relationid" id="" value="<%= rsfb.getRelationId() %>">
                      </td>
                      <td>
                        <%= fd.getFoodName(rsfb.getFoodid()) %>
                      </td>

                      <td>
                        <%= rsfb.getPrice()%>
                      </td>
                      <td>
                        <%= rsfb.getQuantity()%>
                      </td>
                      <td> <img src="<%= rsfb.getPath() %>" class="img-fluid " alt=""></td>

                    </tr>

                    <% } %>
                      <% PizzaDao pd=new PizzaDao(); ArrayList<PizzaBean> list2=pd.getAllFood();
                        PizzaBean pb;
                        %>
                        <tr id="newRow" style=" display: none;">
                          <td scope="row"><input type="checkbox" name="relationid" id="mainCheck" value="<%= storeid %>">
                          </td>
                          <td>
                            <select name="foodid" id="foodid" class="form-control">
                              <option value="select" selected>select</option>
                              <% for(int i=0;i<list2.size();i++) { pb=list2.get(i); %>
                                <option value="<%= pb.getFoodId()%>">
                                  <%= pb.getFoodName() %>
                                </option>

                                <%} %>
                            </select>
                          </td>

                          <td> <input type="text" class="form-control" name="price" id="" aria-describedby="helpId"
                              placeholder="Enter Price"></td>
                          <td> <input type="text" class="form-control" name="quantity" id="" aria-describedby="helpId"
                              placeholder="Enter Quantity"></td>
                          <td> <input type="file" class="form-control" name="imagefile" id="" aria-describedby="helpId"
                              placeholder="Enter Food Image"></td>

                        </tr>
              </tbody>

            </table>


          </form>
          <div>
            <% if(list.isEmpty()){ %>
              <br><br>
              <div class="mycenter col-4">
                <h3> List is empty</h3>
              </div>
              <% } %>
          </div>

          <div class="modal-dialog modal-dialog-centered">

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    Are You Sure to delete food?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" id='deleteFood'>Delete</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-dialog modal-dialog-centered">

            <div class="modal fade" id="addstrfood" tabindex="-1" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="addstrfoodLabel">Add Food in this Store</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                   <form action="AddNewFoodInStore" id="FoodFormModal" enctype='multipart/form-data' method="post" onsubmit="return uploadFile()">
                    <div class="mb-3">
                      <select name="foodid" id="foodid" class="form-control">
                        <option value="select" selected>select</option>
                        <% for(int i=0;i<list2.size();i++) { pb=list2.get(i); %>
                          <option value="<%= pb.getFoodId()%>">
                            <%= pb.getFoodName() %>
                          </option>

                          <%} %>
                      </select>
                    </div>
                    <div class="mb-3">
                      <input type="text" class="form-control" name="price" id="" aria-describedby="helpId"
                              placeholder="Enter Price"></td>
                    </div>
                    <div class="mb-3">
                      <input type="text" class="form-control" name="quantity" id="" aria-describedby="helpId"
                              placeholder="Enter Quantity">
                              <input type="text"   class="form-control"  style='display:none;' name="storeid" id="setStoreid" value="" aria-describedby="helpId"
                              placeholder="Enter Food Image">
                    </div>
                    <div class="mb-3">
                      <input type="file" id="ajaxfile" accept="image/*" class="form-control" name="imageFile" id="" aria-describedby="helpId"
                              placeholder="Enter Food Image">
                    </div>
                   </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" onclick="myuploadFile()" id='addstrfoodbutton'>Add Food</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

      </div>
      
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script src="./resources/script/Managestoresrc.js">


      </script>

      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

    </body>

    </html>