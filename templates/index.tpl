<!DOCTYPE html>
<html lang="en">
<head>
    <!--<< Required meta tags >>-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<< Title >>-->
    <title>Matias - Personal Portfolio Template</title>
    <!--<< Favcion >>-->
    <link rel="shortcut icon" href="assets/img/logo/favicon.png">
    <!--<< Bootstrap min.css >>-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!--<< Aos animation css >>-->
    <link rel="stylesheet" href="assets/css/aos.css">
    <!--<< Main.css >>-->
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>

<!--<< blog >>-->
<section class="blog__section overhid pt-120 pb-120">
    <div class="container">
        {foreach $categories as $category}
            <div class="row g-4">
                <div class="col-xl-4 col-lg-3">
                    <div class="project__head">
                        <span class="common__sub" data-aos="fade-down" data-aos-duration="1000"></span>
                        <h2 class="fw-500 mt-3" data-aos="fade-down" data-aos-duration="1500">
                            {$category.name}
                        </h2>
                        <div class="blog__hoverbox">
                            <a href="/category/{$category.id}" class="hover__circle wow fadeInUp" data-wow-duration="1.6s">
                     <span class="box">
                        <i class="bi bi-arrow-up-right"></i>
                        <span class="textmore">
                           Все статьи
                        </span>
                     </span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-9">
                    <div class="blog__rightwrap">
                        <div class="service__uniquewrap">
                            {foreach $category.articles as $article}
                                <div class="service__unique__item pb-40 pt-40" data-aos="fade-up" data-aos-duration="{(1000 + $article@index * 200)}">
                                    <div class="left__service">
                                        <div class="serial__adjust">
                                            <div class="cont">
                                            <span class="dates">{$article.created_at|date_format:"%b %e, %Y"}</span>
                                                <h3>
                                                    <a href="blog.html">{$article.title}</a>
                                                </h3>
                                            </div>
                                        </div>
                                        <a href="{$article.image}" class="opa__thumb imgc">
                                            <img src="{$article.image}" alt="img-opa">
                                        </a>
                                    </div>
                                    <a href="{$article.image}" class="common__icon imgc">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
</section>
<!--<< blog >>-->

<!--<< Jquery Latest >>-->
<script src="assets/js/jquery-3.7.0.min.js"></script>
<!--<< Viewport Js >>-->
<script src="assets/js/viewport.jquery.js"></script>
<!--<< Bootstrap Js >>-->
<script src="assets/js/bootstrap.min.js"></script>
<!--<< Aos animation Js >>-->
<script src="assets/js/aos.js"></script>
<!--<< Nice Select Js >>-->
<script src="assets/js/jquery.nice-select.min.js"></script>
<!--<< Swiper Slide Js >>-->
<script src="assets/js/swiper-bundle.min.js"></script>
<!--<< Swiper Bundle Js >>-->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<!--<< magnific popup Js >>-->
<script src="assets/js/odometer.min.js"></script>
<!--<< Odometer js Js >>-->
<script src="assets/js/wow.min.js"></script>
<!--<< Wow Animation js >>-->
<script src="assets/js/main.js"></script>
<!--<< Main.js >>-->
</body>
</html>
