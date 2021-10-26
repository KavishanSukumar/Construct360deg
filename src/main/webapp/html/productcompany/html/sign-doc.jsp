
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign documents</title>
    <link rel="stylesheet" href=".html/productcompany/resources/css/sign-doc.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
<!-- <input type="checkbox" id="check"> -->
<!-- header area start -->
<div class="container">
    <%@include file="sidebar-productcompany.jsp"%>


    <div class="content">
        <div class="doc-area">
            <div class="rules_reg">
                <header>Rules and Regulations</header>
                <p>
                    Although rules and regulators are quite different from each other, they are often confused. This is because both must be followed. But in fact, they differ from each other in their purpose of creation. In this article, we want to explain the difference between rules and regulations.
                    Rules are guidelines and instructions for doing something right. It is created to manage behavior in an organization or country. They are written principles. On the other hand, regulations are directives made in addition to the laws in a particular country. These are arranged according to the places that are missing in the existing system.
                    <br> <br>
                    The main difference between rule and regulation is that the nature of the rules is more flexible. On the other hand, the heart of the regulations is more stringent. Rules are set according to individuals and organizations, regulations according to the state. Another difference between the two is the rules are the set of instructions given to the public. Regulations are rules accepted legally by the administration. Rules are part of the regulation, but regulations are part of the law.
                    The reason why the two concepts are confused is that they have many similarities. For example, both are part of the constitution. However, violation of both concepts can result in penalties.
                    <br> <br>
                    What Are The Rules For AML?
                    The purpose of the AML rules is to help detect and report suspicious activity, including antecedents for money laundering and terrorist financing. The rules are flexible, as mentioned above. For this reason, regulations rather than rules have a more important place in the AML sector.
                    <br> <br>
                    What Are The Regulations For AML?
                    Each country has its AML regulations. The regulatory bodies carry this out in the countries. Major AML Regulatory agencies are as follows.
                    <br> <br>
                    Financial Action Task Force (FATF)
                    The Financial Action Task Force (FATF) recommendations are internationally accepted standards against money laundering and terrorist financing. FATF is an intergovernmental organization, and it has 36 member giants and handles every major financial center. Its primary task is to set global standards for AML compliance. FATF's requirements are mainly to know the customer, implement due diligence measures, regularly monitor suspicious financial activities, and impose effective sanctions against individuals and institutions that do not comply with FATF regulations.
                    <br> <br>
                    European Union AML Directives
                    These are directives prepared by the European Union. The aim is to harmonize the AML / CFT legislation of the member states. It is published periodically and is prepared, taking into account the risks the market faces and the potential to encounter. There are six directives published so far. They have made some changes in these directives depending on the time they were issued. For example, the 5th AMLD was published when there was an agenda for the appreciation of cryptocurrencies. The directive contains regulations against cryptocurrencies.
                    <br> <br>
                    Financial Conduct Authority (FCA)
                    The Financial Conduct Authority is the body responsible for regulating financial services in the UK. FCA operates independently from the UK government. It was created by the 2021 Financial Services law. The establishment purpose of FCA is to regulate the behavior of financial firms. To achieve this goal, it has the powers to set rules, implement, investigate and execute.
                </p>

            </div>
        </div>


        <div class="sign-area">
            <!-- <div class="inputfield terms">
                   <label class="check">
                     <input type="checkbox">
                     <span class="checkmark"></span>
                   </label>
                   <h4>Agreed to terms and conditions</h4>
                </div>  -->


            <div class="customer-area">
                <h2>Customer</h2>
                <form  action="">

                    <label for="cusname">Name : </label>
                    <input type="text" id="cusname" name="cusname" required><br><br>

                    <label for="cus-sign">Signature/Seal :</label><br>
                    <textarea id="cus-sign" name="cus-sign" required></textarea><br><br>
                    <label class="check-box">Agreed to rules and regulations
                        <input type="checkbox" hidden >
                        <span class="checkmark"></span>
                    </label>

                    <input type="submit" value="Submit">
                </form>
                <!-- <p>Date/Time: <span id="datetime"></span></p>

                <script>
                var dt = new Date();
                document.getElementById("datetime").innerHTML = dt.toLocaleString();
                </script> -->
            </div>

            <div class="prof-area">
                <h2>Proffessional</h2>
                <form  action="">

                    <label for="profname">Name : </label>
                    <input type="text" id="profname" name="profname" required><br><br>

                    <label for="prof-sign">Signature/Seal :</label><br>
                    <textarea id="prof-sign" name="prof-sign" required></textarea><br><br>
                    <label class="check-box">Agreed to rules and regulations
                        <input type="checkbox" hidden >
                        <span class="checkmark"></span>
                    </label>

                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>All rights reserved © 2020  Construct360<sup>0</sup>.com<br>Design: Epic code</p>
    </div>
</div>
</body>
