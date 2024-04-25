<link rel="icon" type="image/png" href="{{ asset($setting->favicon_image) }}">
<link rel="stylesheet" href="{{ mix('frontend/vendor.min.css') }}">
<link rel="stylesheet" href="{{ mix('frontend/app.min.css') }}">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/customfont.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/flag-icon.min.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/flags.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/rtl-app.css">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">


<style>
    @media (max-width: 575px) {
        .rt-single-icon-box .iconbox-content {
            flex-shrink: 1 !important;
        }
    }

    body .select2.select2-container {
        z-index: 5 !important;
    }

    .notification-bar .notification-header {
        padding: 24px 24px 0px !important;
    }

    .togglesearch,
    .mblTogglesearch {
        display: none;
        position: absolute;
        bottom: -100px;
        left: 0;
        right: 0;
        z-index: 10000;
    }

    .joblist-fliter-gorup .left-content .w-100-p {
        width: auto !important;
    }

    .search-box svg {
        left: 20px;
        top: 12px;
    }

    .search-box .search-input {
        width: 450px !important;
        padding-left: 60px;
    }

    @media (max-width: 991px) {
        .search-box .search-input {
            width: 100% !important;
        }
    }

    .notification-bar {
        width: 290px;
        max-width: 425px !important;
        z-index: 1000 !important;
        right: 20px !important;
        top: 56px !important;
    }

    @media (min-width: 768px) {
        .notification-bar {
            width: 425px !important;
        }
    }

    .search-icon {
        margin-right: 24px !important;
    }

    .rt-mobile-menu-overlay {
        top: 55px !important;
        right: 0 !important;
        left: auto !important;
    }
    .breadcrumbs, .breadcrumbs-two{
        padding: 24px 0 24px !important;
    }
    .banner-section{
        padding-top: 40px !important;
    }
    .n-header .brand-logo img {
        max-width: 280px;
        width: 100%;
    }
    @media (max-width:575px) {
        .brand-logo img {
            width: 180px !important;
        }
    }

    .n-header--top {
        background: white !important;
    }

    .n-header--top .n-header--top__right {
        gap: 24px !important;
    }

    .custom-border li a {
        border-bottom: none !important;
        padding: 0px !important;
    }

    .n-header--top .n-header--top__right .dropdown .btn {
        padding: 0px !important;
    }

    .n-header--top .n-header--top__right .dropdown .dropdown-menu {
        position: absolute !important;
        inset: auto !important;
        transform: translate3d(0px, 27px, 0px) !important;
        right: 0 !important;
        top: 0 !important;
    }

    .n-header--bottom {
        padding: 20px 0px !important;
        box-shadow: inset 0px -1px 0px #E4E5E8;
    }

    .n-header--bottom .btn{
        text-overflow: ellipsis;
        white-space: nowrap;
        max-width: 140px;
    }

    .main-menu .menu-active-classes,
    .main-menu .custom-border {
        display: flex;
        gap: 24px;
    }


    .main-menu .menu-active-classes li a {
        padding: 14px 0px !important;
        border-bottom: 2px solid transparent !important;
    }

    .candidate-profile img {
        border-radius: 100% !important;
        object-fit: cover;
        object-position: top center;
    }
    .account-setup-header{
        border-bottom: 1px solid #e4e5e8;
    }
    .account-progress-wrap{
        height: 83vh;
        overflow-y: auto;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
    .account-progress-wrap::-webkit-scrollbar {
        display: none;
    }
    .main-menu .menu-active-classes li:hover a {
        color: var(--primary-500) !important;
        border-bottom: 2px solid var(--primary-500) !important;
    }

    .main-menu .menu-active-classes li a:last-child {
        padding-right: 0px !important;
    }

    .n-header--bottom .n-header--bottom__left {
        gap: 32px !important;
    }

    .n-header--bottom .n-header--bottom__right {
        margin-left: auto;
    }

    .n-header--bottom .n-header--bottom__right ul {
        gap: 12px !important;
        margin-bottom: 0px;
    }

    .globe-spacing {
        margin-left: 18px !important;
    }

    .main-menu .custom-border li a:last-child {
        padding-right: 0px !important;
    }

    @media(max-width:991px) {
        .n-header--top {
            padding: 14px 0px !important;
        }

        .main-menu {
            position: absolute;
            width: 100% !important;
            top: 0 !important;
            height: auto !important;
            border-bottom-left-radius: 16px !important;
            border-bottom-right-radius: 16px !important;
            padding-top: 0px !important;
            padding-bottom: 24px !important;
        }

        .main-menu .mbl-top {
            border-bottom: 2px solid #E4E5E8 !important;
            padding-top: 16px !important;
            padding-bottom: 16px !important;
        }

        .main-menu .menu-active-classes {
            flex-direction: column;
            gap: 0px !important;
        }

        .main-menu .menu-active-classes li a {
            padding: 16px 0px !important;
            border-bottom: 1px solid var(--gray-100) !important;
        }

        .main-menu .custom-border li a {
            padding: 0px !important;
        }

        .mbl-btn {
            margin-top: 24px !important;
        }
    }

    @media(max-width:575px) {
        .n-header--top__right .contact-info {
            display: none !important;
        }

        .n-header--top .n-header--top__right .dropdown .dropdown-menu {
            left: 0 !important;
        }
    }


    button.effect1 {
        width: 40px;
        background: transparent;
        border: none;
        height: 35px;
        padding: 0px;
        overflow: hidden;
        margin-top: -10px;
    }

    button.effect1:focus {
        outline: none;
    }

    button.effect1 span {
        display: inline-block;
        width: 80%;
        height: 2px;
        background: #191F33;
        position: relative;
        transition: all .2s;
    }

    button.effect1 span:before,
    button.effect1 span:after {
        content: '';
        position: absolute;
        width: 100%;
        background: #191F33;
        height: 2px;
        left: 0px;
        transition: all .3s;
    }

    button.effect1 span:before {
        top: 10px;
    }

    button.effect1 span:after {
        bottom: 10px;
    }

    button.effect1:hover span:after {
        left: -5px;
    }

    button.effect1:hover span:before {
        left: 5px;
    }

    button.effect1 span.active {
        background: #F1F2F4;
    }

    button.effect1 span.active:after,
    button.effect1 span.active:before {
        top: 0px;
        left: 0px;
    }

    button.effect1 span.active:after {
        transform: rotate(-45deg);
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
    }

    button.effect1 span.active:before {
        transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
    }

    .applied-job-on {
        padding: 28px 32px;
        background: var(--gray-50) !important;
        border-radius: 6px;
    }

    .applied-job-on h2 {
        color: var(--gray-900);
        font-size: 18px;
        line-height: 28px;
        font-weight: 500;
        margin-bottom: 20px;
        padding: 0px;
    }

    .applied-job-on input {
        margin-right: 8px;
        margin-top: 5px;
    }

    .applied-job-on input[type="radio"] {
        -ms-transform: scale(1.2);
        /* IE 9 */
        -webkit-transform: scale(1.2);
        /* Chrome, Safari, Opera */
        transform: scale(1.2);
    }

    .applied-job-on .d-flex {
        align-items: flex-start;
        padding: 16px;
    }

    .applied-job-on .d-flex:hover {
        background: #fff;
        border-radius: 6px;
    }

    .applied-job-on .checked {
        background: #fff;
        border-radius: 6px;
    }

    .applied-job-on label h4 {
        font-weight: 500;
        font-size: 16px;
        line-height: 16px;
        color: var(--gray-900);
        margin: 0px;
    }

    .applied-job-on label p {
        font-weight: 400;
        font-size: 12px;
        line-height: 18px;
        color: var(--gray-600);
    }

    .applied-job-on input[type='radio']:checked+.d-flex {
        background: #fff;
    }

    .account-successfull-wrap {
        max-width: 872px !important;
        text-align: center !important;
        /* text-align: left !important; */
        border-radius: 12px;
    }

    .neg-mar {
        margin-top: -12px;
    }

    .account-successfull-wrap .account-successfull-data h4 {
        margin-bottom: 8px !important;
        padding: 0px 40px;
    }

    .account-successfull-wrap .account-successfull-data p {
        margin-bottom: 20px !important;
        padding: 0px 40px !important;
    }

    .account-successfull-wrap .account-successfull-data .btn {
        margin: 0px 40px !important;
    }

    .account-successfull-wrap .account-successfull-data .btn.mer-0 {
        margin: 0px !important;
    }

    .account-successfull-data form .m-40 {
        gap: 24px;
        margin: 0px 40px !important;
    }

    .account-successfull-data .m-40.bottom {
        margin-top: 32px !important;
    }

    .promote-form {
        padding: 24px;
        background: rgba(241, 242, 244, 0.5);
        border-radius: 8px;
        width: 100%;
        border: 2px solid transparent;
    }

    .promote-form:hover {
        background: var(--primary-50);
        border: 2px solid var(--primary-500);
        border-radius: 8px;
    }

    .promote-form.checked {
        background: var(--primary-50);
        border: 2px solid var(--primary-500);
        border-radius: 8px;
    }

    @media (max-width:767px) {
        .promote-form {
            padding: 12px;
        }
    }

    @media (max-width:767px) {
        .promote-form svg {
            height: 100%;
        }

        .promote-form .ms-5 {
            margin-left: 30px !important;
        }
    }

    .account-successfull-data form h4 {
        margin-bottom: 10px !important;
        padding: 0px 40px;
    }

    .account-successfull-wrap .account-successfull-data hr {
        margin: 32px 0;
    }

    #cvModal .modal-dialog {
        max-width: 872px !important;
    }

    #cvModal .modal-content {
        padding: 32px;
    }

    #cvModal .modal-body,
    #cvModal .modal-header,
    #cvModal .modal-footer {
        padding: 0px !important;
    }

    #cvModal .modal-body form label {
        margin-bottom: 8px !important;
    }

    #cvModal .modal-body form .select2,
    #cvModal .modal-body form textarea {
        margin-bottom: 16px !important;
    }

    #cvModal .modal-footer,
    #resumeModal .modal-footer {
        justify-content: space-between !important;
    }

    #cvModal .modal-title {
        font-weight: 500;
        font-size: 18px;
        line-height: 28px;
        color: var(--gray-900);
    }

    #cvModal textarea {
        font-weight: 400;
        font-size: 16px;
        line-height: 24px;
        color: var(--gray-400);
    }

    #pills-tab {
        margin-bottom: 32px;
    }

    .resume {
        margin-top: 32px;
        margin-bottom: 18px;
    }

    .resume-lists {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 24px;
    }

    .resume-item {
        display: flex;
        gap: 12px;
        background: rgba(241, 242, 244, 0.5);
        border-radius: 6px;
        padding: 20px;
        align-items: center;
    }

    .resume-item.add-resume {
        background: #FFFFFF;
        border: 2px dashed #E4E5E8;
        border-radius: 6px;
        cursor: pointer;
    }

    .resume-item.add-resume .resume-size {
        font-size: 12px !important;
    }

    .resume-title {
        font-weight: 500 !important;
        font-size: 14px !important;
        line-height: 20px !important;
        color: var(--gray-900) !important;
        margin: 0px !important;
    }

    .resume-size {
        font-weight: 400 !important;
        font-size: 14px !important;
        line-height: 20px !important;
        color: var(--gray-600) !important;
        margin: 0px !important;
        margin-bottom: 0px !important;
    }

    /* Image Upload Class */
    .file-upload {
        background-color: rgba(241, 242, 244, 0.4);
        margin: 0 auto;
        padding: 20px;
    }

    .profile-file-upload-content2 {
        text-align: center;
        position: relative;
    }

    .banner-file-upload-content2 {
        text-align: center;
        position: relative;
    }

    .profile-file-upload-content,
    .banner-file-upload-content,
    .resume-file-upload-content.none {
        display: none;
        text-align: center;
        position: relative;
    }

    .file-upload-input {
        position: absolute;
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        outline: none;
        opacity: 0;
        cursor: pointer;
    }

    .profile-remove-image,
    .banner-remove-image,
    .cv-remove-image {
        position: absolute;
        right: 0;
        border: transparent;
        top: 0;
        z-index: 99;
    }

    .cv-remove-image {
        top: -65px !important;
    }

    .profile-image-upload-wrap,
    .banner-image-upload-wrap,
    .cv-image-upload-wrap {
        background-color: rgba(241, 242, 244, 0.4);
        border: 2px dashed rgba(200, 204, 209, 0.7);
        border-radius: 6px;
        padding: 0px 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 240px;
        position: relative !important;
    }

    .resume-file-upload-content {
        background: rgba(241, 242, 244, 0.4);
        border: 2px dashed transparent;
        border-radius: 6px;
        height: 240px;
        display: flex;
        vertical-align: middle;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    .resume-file-upload-content .wrap {
        text-align: center;
        margin: 0px auto;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        position: relative;
    }

    .image-title-wrap {
        padding: 0 15px 15px 15px;
        color: #222;
    }

    .drag-text {
        text-align: center;
    }

    .drag-text svg {
        margin-bottom: 16px;
    }

    .drag-text h3,
    .resume-file-upload-content h3 {
        font-weight: 500;
        font-size: 14px;
        line-height: 20px;
        text-align: center;
        color: var(--gray-900);
        margin-bottom: 6px;
    }

    .drag-text h3 span {
        font-weight: 400;
    }

    .drag-text p,
    .resume-file-upload-content p {
        font-weight: 400;
        font-size: 12px;
        line-height: 18px;
        text-align: center;
        color: var(--gray-500);
    }

    .profile-file-upload-image,
    .banner-file-upload-image {
        width: 100%;
        height: 240px;
        max-height: 240px;
        object-fit: cover;
        margin: auto;
    }

    .custom-breadcrumb p .inactive {
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        color: var(--gray-600);
    }

    .custom-breadcrumb p .active {
        color: var(--primary-500);
    }

    .custom-breadcrumb p {
        margin-bottom: 6px !important;
    }

    .application-wrapper-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
    }

    .application-wrapper-top .title {
        font-weight: 500;
        font-size: 20px;
        line-height: 32px;
        color: var(--gray-900);
        margin-bottom: 0px !important;
    }

    .application-wrapper-top .btn {
        font-weight: 500 !important;
        font-size: 14px !important;
        line-height: 20px !important;
        padding: 6px 12px !important;
    }

    .application-wrapper-bottom {
        display: flex;
        gap: 24px;
        overflow: hidden;
        overflow-x: scroll;
    }

    .all-application-column,
    .short-application-column,
    .new-application-column {
        background: rgba(241, 242, 244, 0.5);
        border: 1px solid var(--gray-100);
        border-radius: 6px;
        height: 100vh;
        padding: 16px 20px !important;
        overflow: hidden;
        overflow-y: scroll;
    }

    .all-application-column::-webkit-scrollbar,
    .short-application-column::-webkit-scrollbar,
    .new-application-column::-webkit-scrollbar {
        display: none;
    }

    .column-title {
        margin-bottom: 12px;
    }

    .column-title h4 {
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        color: var(--gray-900);
        margin-bottom: 0px;
    }

    .column-title .btn {
        padding: 0px !important;
    }

    .new-application-column {
        height: fit-content !important;
    }

    .follow-us {
        font-weight: 500;
        margin-bottom: 16px;
    }

    .social-icon:hover {
        background-color: var(--primary-500) !important;
    }

    .social-icon:hover svg path {
        fill: white;
    }

    .new-application-column .btn {
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 500 !important;
        font-size: 14px !important;
        line-height: 20px !important;
        color: var(--gray-900) !important;
    }

    .new-application-column .btn svg {
        margin-right: 8px !important;
    }

    /* Application Card */
    .application-card {
        background: #FFFFFF;
        border: 1px solid #E4E5E8;
        box-shadow: 0px 3px 16px rgba(24, 25, 28, 0.04);
        border-radius: 6px;
        padding: 16px;
        margin-bottom: 12px;
        cursor: pointer;
    }

    .application-card hr {
        background-color: var(--gray-100);
    }

    .appliaction-card-top {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .appliaction-card-top .profile-image img {
        width: 48px !important;
        max-width: 48px !important;
        height: 48px !important;
        max-height: 48px !important;
        border-radius: 100% !important;
    }

    .appliaction-card-top .profile-info .name {
        font-weight: 500;
        font-size: 14px;
        line-height: 20px;
        color: var(--gray-900);
        margin-bottom: 4px !important;
    }

    .appliaction-card-top .profile-info .designation {
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        color: var(--gray-500);
        margin-bottom: 0px;
    }

    .application-card-bottom .lists {
        padding: 0px !important;
        margin: 0px !important;
        list-style-position: inside;
        margin-bottom: 16px !important;
    }

    .application-card-bottom .lists li {
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        color: var(--gray-600);
        margin-bottom: 5px;
    }

    .application-card-bottom .download-cv-btn .btn {
        padding: 0px !important;
    }

    .application-card-bottom .download-cv-btn .btn svg {
        margin-right: 6px;
    }

    #newColumnModal .modal-dialog {
        max-width: 536px !important;
    }

    #newColumnModal .modal-header {
        border: transparent;
        padding-bottom: 0px !important;
        margin-bottom: 16px !important;
    }

    #newColumnModal .modal-header .modal-title {
        font-weight: 500;
        font-size: 18px;
        line-height: 28px;
        color: var(--gray-900);
    }

    #newColumnModal .modal-body {
        padding: 0px 32px !important;
    }

    .select-custom-icon {
        position: absolute;
        top: 17px;
        left: 20px;
        z-index: 10000;
    }

    .custom-select-padding .mborder {
        border: 1px solid #E4E5E8;
        border-radius: 5px;
        width: 100%;
    }

    .custom-select-padding {
        margin-bottom: 18px;
    }

    .custom-select-padding p {
        margin-bottom: 8px !important;
    }

    .custom-select-padding .select2-container .select2-selection--single .select2-selection__rendered {
        padding-left: 50px !important;
        padding-right: 120px !important;
    }

    .custom-select-padding .select2-container--default .select2-selection--single {
        border: 1px solid transparent !important;
    }

    .cross-btn:hover svg path {
        stroke: #fff;
    }

    .add-new-social.btn-primary2-50 {
        color: #18191C;
    }

    .add-new-social svg {
        margin-right: 8px;
    }

    .add-new-social:hover svg path {
        stroke: #fff !important;
    }

    .add-new-social:hover {
        color: #fff !important;
    }

    .sort-dropdown,
    .filter-dropdown {
        padding: 20px !important;
    }

    .sort-dropdown p,
    .filter-dropdown p {
        font-weight: 500;
        font-size: 12px;
        line-height: 18px;
        color: #9199A3;
    }

    .sort-dropdown p,
    .sort-dropdown li,
    .filter-dropdown p,
    .filter-dropdown ul>ul>li {
        margin-bottom: 12px;
    }

    .sort-dropdown li label,
    .filter-dropdown li label {
        font-weight: 400;
        font-size: 14px;
        line-height: 20px;
        color: #5E6670;
        margin-left: 8px;
    }

    .application-card-wrapper {
        height: 100% !important;
    }

    .column {
        min-width: 296px !important;
    }
</style>
@stack('frontend_links')
@yield('frontend_links')

<style>
    :root {
        --primary-500: {{ $setting->frontend_primary_color }} !important;
        --primary-600: {{ adjustBrightness2($setting->frontend_primary_color, 0.5) }} !important;
        --primary-100: {{ adjustBrightness2($setting->frontend_primary_color, 0.8) }} !important;
        --primary-50: {{ adjustBrightness2($setting->frontend_primary_color, 0.93) }} !important;
        --gray-20: {{ adjustBrightness2($setting->frontend_primary_color, 0.98) }} !important;
    }
</style>
