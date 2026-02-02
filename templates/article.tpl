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
    <link rel="shortcut icon" href="/assets/img/logo/favicon.png">
    <!--<< Bootstrap min.css >>-->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <!--<< Aos animation css >>-->
    <link rel="stylesheet" href="/assets/css/aos.css">
    <!--<< Main.css >>-->
    <link rel="stylesheet" href="/assets/css/main.css">
</head>
<body>

<!--<< banner >>-->
<section class="breadcrumnd__section">
    <div class="container pt-120 pb-120">
        <div class="row g-4 justify-content-center">
            <div class="col-lg-8">
                <div class="breadcrumnd__wrap text-center">
                    <h1>
                        {$article.title}
                    </h1>
                    <ul class="breakcrumnd__cont justify-content-center">
                        <li>
                            <a href="/">
                                Главный
                            </a>
                        </li>
                        <li class="white">
                            /
                        </li>
                        <li class="base">
                            {$article.title}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!--<< banner >>-->

<!--<< blog >>-->
<section class="blog__bsection pb-120">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="blog__bleft__wrapper">
                    <div class="blog__bitem mb__cus50" data-aos="fade-up" data-aos-duration="1000">
                        <img src="{$article.image}" alt="img">
                        <div class="content">
                            <span
                                class="bdate d-flex align-items-center gap-1 ptext fz-16">{$article.created_at|date_format:"%b %e, %Y"} | <i
                                    class="bi bi-eye"></i> {$article.views}</span>
                            <h3>
                                {$article.title}
                            </h3>
                            <p class="fz-16 ptext">{$article.content}</p>
                        </div>
                    </div>
                </div>
            </div>
            {if $related_articles}
                <div class="col-lg-4">
                    <div class="blog__bright__bar">
                        <div class="scope__item mb__cus60">
                            <h4 class="scope__title">
                                Похожий стати
                            </h4>
                            <ul class="recent__post">
                                {foreach $related_articles as $item}
                                    <li>
                                        <a href="/articles/{$item.id}" class="recent__innter">
                                            <img width="150px" src="{$item.image}" alt="img">
                                            <div class="cont__box">
                                                <span class="retitle">{$item.title}</span>
                                                <span class="base fz-16 d-flex align-items-center gap-2">
                                                    <i class="bi bi-clock"></i>{$article.created_at|date_format:"%b %e, %Y"}<i class="bi bi-eye"></i> {$article.views}
                                                </span>
                                            </div>
                                        </a>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</section>
<!--<< blog >>-->

<!--<< Jquery Latest >>-->
<script src="/assets/js/jquery-3.7.0.min.js"></script>
<!--<< Viewport Js >>-->
<script src="/assets/js/viewport.jquery.js"></script>
<!--<< Bootstrap Js >>-->
<script src="/assets/js/bootstrap.min.js"></script>
<!--<< Aos animation Js >>-->
<script src="/assets/js/aos.js"></script>
<!--<< Nice Select Js >>-->
<script src="/assets/js/jquery.nice-select.min.js"></script>
<!--<< Swiper Slide Js >>-->
<script src="/assets/js/swiper-bundle.min.js"></script>
<!--<< Swiper Bundle Js >>-->
<script src="/assets/js/jquery.magnific-popup.min.js"></script>
<!--<< magnific popup Js >>-->
<script src="/assets/js/odometer.min.js"></script>
<!--<< Odometer js Js >>-->
<script src="/assets/js/wow.min.js"></script>
<!--<< Wow Animation js >>-->
<script src="/assets/js/main.js"></script>
<!--<< Main.js >>-->
</body>
</html>
