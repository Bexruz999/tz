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

<!--<< project one >>-->
<section class="project__section pt-120 pb-120" id="prot">
    <div class="container">
        <div class="project__head text-center">
         <span class="common__sub" data-aos="fade-down"
               data-aos-duration="1000">
           Категория
         </span>
            <h2 class="fw-500" data-aos="fade-down"
                data-aos-duration="2000">
                {$category.name}
            </h2>
        </div>
        <div class="row mb-5">
            <div class="col-lg-6 col-md-6">
                <a href="?id={$category.id}&sort=date&page=1" class="common__icon base2 {if $current_sort === 'date'}text-secondary{/if}"> По дате публикации</a>
            </div>
            <div class="col-lg-6 col-md-6">
                <a href="?id={$category.id}&sort=views&page=1" class="common__icon base2 {if $current_sort === 'views'}text-secondary{/if}">По кол-во просмотров</a>
            </div>
        </div>
        <div class="row g-4">
            <div class="col-lg-6 col-md-6">
                <div class="project__wrapone">
                    {foreach $category.articles as $article}
                        {if $article@index % 2 === 0}
                            <div class="project__item cus__mb60" data-aos="fade-up"
                                 data-aos-duration="1000">
                                <a href="{$article.image}" class="thumb mb-30 imgc">
                                    <img src="{$article.image}" alt="img">
                                </a>
                                <div class="content d-flex align-items-center justify-content-between gap-2">
                                    <a href="protfolio.html" class="left__cont">
                                        <span class="base mb-2 mb-xxl-3 d-block text-uppercase">{$article.created_at|date_format:"%b %e, %Y"} | <i class="bi bi-eye"></i> {$article.views}</span>
                                        <h3>{$article.title}</h3>
                                    </a>
                                    <a href="/assets/img/project/pro1.png" class="common__icon imgc">
                                        <i class="bi bi-arrow-up-right"></i>
                                    </a>
                                </div>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="project__wraptwo">
                    {foreach $category.articles as $article}
                        {if $article@index % 2 != 0}
                            <div class="project__item cus__mb60" data-aos="fade-up"
                                 data-aos-duration="2200">
                                <a href="assets/img/project/pro2.png" class="thumb mb-30 imgc">
                                    <img src="{$article.image}" alt="img">
                                </a>
                                <div class="content d-flex align-items-center justify-content-between gap-2">
                                    <a href="protfolio.html" class="left__cont">
                                        <span class="base mb-2 mb-xxl-3 d-block text-uppercase">{$article.created_at|date_format:"%b %e, %Y"} | <i class="bi bi-eye"></i> {$article.views}</span>
                                        <h3>{$article.title}</h3>
                                    </a>
                                    <a href="/assets/img/project/pro2.png" class="common__icon imgc">
                                        <i class="bi bi-arrow-up-right"></i>
                                    </a>
                                </div>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
        {if $category.total_pages > 1}
            {assign var="range" value=2}
            <div class="pagination__box cmn__bg">
                <ul class="pagi">
                    {if $current_page > 1}
                        <li>
                            <a href="?id={$category.id}&sort={$current_sort}&page={$current_page - 1}">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </li>
                        {if $current_page - 2 > 0}
                            <li>
                                <a href="?id={$category.id}&sort={$current_sort}&page={$current_page - 2}">{$current_page - 2}</a>
                            </li>
                        {/if}
                    {else}
                        <li>
                            <a href="?id={$category.id}&sort={$current_sort}&page={$current_page}">{$current_page}</a>
                        </li>
                    {/if}

                    {for $p=1 to $category.total_pages}
                        {if $p > 1 && $p < $category.total_pages}
                            {if $p >= ($current_page - $range) && $p <= ($current_page + $range)}
                                <li>
                                    <a href="?id={$category.id}&sort={$current_sort}&page={$p}">{$p}</a>
                                </li>
                            {/if}
                        {/if}
                    {/for}

                    {if $category.total_pages > 1}
                        <li>
                            <a href="?id={$category.id}&sort={$current_sort}&page={$current_page + 1}"><i class="bi bi-chevron-right"></i></a>
                        </li>
                    {/if}
                </ul>
            </div>
        {/if}
    </div>
</section>
<!--<< project one >>-->

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
