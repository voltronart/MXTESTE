{# Detect presence of features that remove empty placeholders #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_video = settings.video_embed %}
{% set has_main_categories = settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
{% set has_banners = settings.banner and settings.banner is not empty %}
{% set has_promotional_banners = settings.banner_promotional and settings.banner_promotional is not empty %}
{% set has_news_banners = settings.banner_news and settings.banner_news is not empty %}
{% set has_image_and_text_modules = settings.module and settings.module is not empty %}
{% set has_brands = settings.brands and settings.brands is not empty %}
{% set has_informative_banners = settings.banner_services and (settings.banner_services_01_title or settings.banner_services_02_title or settings.banner_services_03_title or settings.banner_services_01_description or settings.banner_services_02_description or settings.banner_services_03_description) %}
{% set has_instafeed = settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
{% set has_institutional_message = settings.institutional_message or settings.institutional_text or settings.institutional_subtitle %}
{% set has_welcome_message = settings.welcome_message or settings.welcome_text or settings.welcome_subtitle %}

{% set has_testimonial_01 = settings.testimonial_01_description or settings.testimonial_01_name or "testimonial_01.jpg" | has_custom_image %}
{% set has_testimonial_02 = settings.testimonial_02_description or settings.testimonial_02_name or "testimonial_02.jpg" | has_custom_image %}
{% set has_testimonial_03 = settings.testimonial_03_description or settings.testimonial_03_name or "testimonial_03.jpg" | has_custom_image %}
{% set has_testimonials = has_testimonial_01 or has_testimonial_02 or has_testimonial_03 %}

{% set show_help = not (has_main_slider or has_mobile_slider or has_video or has_main_categories or has_banners or has_promotional_banners or has_news_banners or has_image_and_text_modules or has_brands or has_informative_banners or has_instafeed or has_testimonials or has_institutional_message or has_welcome_message) and not has_products %}

{% set show_component_help = params.preview %}

{% if not params.preview %}
	{% set admin_link = is_theme_draft ? '/admin/themes/settings/draft/' : '/admin/themes/settings/active/' %}
{% endif %}

{% set newArray = [] %}
<div class="js-home-sections-container home-sections-container">
	<section class="trust-bar">
        <div class="container-fluid">
            <div class="trust-wrapper">
                <div class="trust-item" onclick="openSecureModal('shipping')">
                    <span class="trust-icon">🚚</span>
                    <div class="trust-text">
                        <strong>ENVIO PARA TODO BRASIL</strong>
                        <span>Rápido e rastreado</span>
                    </div>
                </div>
                <div class="trust-item" onclick="openSecureModal('security')">
                    <span class="trust-icon">🔒</span>
                    <div class="trust-text">
                        <strong>COMPRA 100% SEGURA</strong>
                        <span>Site criptografado</span>
                    </div>
                </div>
                <div class="trust-item" onclick="openSecureModal('payment')">
                    <span class="trust-icon">💳</span>
                    <div class="trust-text">
                        <strong>PAGAMENTO FACILITADO</strong>
                        <span>Até 12x ou PIX</span>
                    </div>
                </div>
                <div class="trust-item" onclick="openSecureModal('help')">
                    <span class="trust-icon">💬</span>
                    <div class="trust-text">
                        <strong>DÚVIDAS? WHATSAPP</strong>
                        <span>Suporte especializado</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div id="music-player" class="music-player">
    <div class="player-content" onclick="toggleMusic()">
        <span id="music-icon" class="music-icon">🔇</span>
    </div>
    <audio id="bg-audio" loop>
        <source src="{{ 'images/audio.mp3' | static_url }}" type="audio/mpeg">
        Seu navegador não suporta áudio.
    </audio>
</div>
    {% for i in 1..18 %}
		{% set section = 'home_order_position_' ~ i %}
		{% set section_select = attribute(settings, section) %}

		{% if section_select not in newArray %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge([section_select]) %}
		{% endif %}


{% if section_select == 'slider' %}
        <section class="custom-categories-home my-4">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-12 text-center mb-4">
                    <h2 class="h1">CAMISETAS</h2>
                </div>
                  <div class="scroll-container px-2">
                    {# Item 1 #}
                     <div class="scroll-item">
                    
                        <a href="/produtos/camisetas/camiseta-gola-polo" class="text-decoration-none">
                            <img src="{{ 'images/cat-30.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            
                           <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">GOLA POLO</p>
                        </a>
                    </div>
                    
                    {# Item 2 #}
                    <div class="scroll-item">
                    
                        <a href="/produtos/camisetas/camiseta-peruana" class="text-decoration-none">
                            <img src="{{ 'images/cat-2.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                           <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">PERUANA</p>
                        </a>
                    </div>
                    {#item 3#}
                        <div class="scroll-item">
                        <a href="/produtos/camisetas/camiseta-malha-pima1" class="text-decoration-none">
                            <img src="{{ 'images/cat-3.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">MALHA PIMA</p>
                        </a>
                    </div>
                   {# item 4 #}
                        <div class="scroll-item">
                        <a href="/produtos/camisetas/camiseta-dry-fit" class="text-decoration-none">
                     <img src="{{ 'images/cat-31.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                       <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                       <p class="text-center font-weight-bold mt-2 text-dark">DRY FIT</p>
                        </a>
                    </div>
                   <div class="scroll-item">
                        <a href="/produtos/camisetas/camiseta-oversized" class="text-decoration-none">
                            <img src="{{ 'images/cat-32.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">OVERSIZED</p>
                        </a>
                    </div>


                </div>
            </div>
        </section>
    {% endif %}

    
	{% if section_select == 'slider' %}
        <section class="custom-categories-home my-4">
            <div class="container-fluid">
                <div class="row ">
                   
                    <div class="col-12 text-center mb-4">
                    <h2 class="h1">Shorts</h2>
                </div>

                 <div class="scroll-container px-2">

                    <div class="scroll-item">
                        <a href="/produtos/shorts/cargo" class="text-decoration-none">
                            <img src="{{ 'images/cat-9.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">CARGO</p>
                        </a>
                    </div>
                    
                    <div class="scroll-item">
                        <a href="/produtos/shorts/elastano" class="text-decoration-none">
                            <img src="{{ 'images/cat-8.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">ELASTANO</p>
                        </a>
                    </div>
                    <div class="scroll-item">
                        <a href="/produtos/shorts/short-sarja" class="text-decoration-none">
                            <img src="{{ 'images/cat-10.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">SARJA</p>
                        </a>
                    </div>
                    
                    <div class="scroll-item">
                        <a href="/produtos/shorts/short-jogador" class="text-decoration-none">
                            <img src="{{ 'images/cat-11.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">JOGADOR</p>
                        </a>
                    </div>  
                    
                    
                    
                
                   
                    {# Adicione mais 2 colunas se quiser fechar 4 no desktop #}
                </div>
            </div>
        </section>
    {% endif %}
    	{% if section_select == 'slider' %}
        <section class="custom-categories-home my-4">
            <div class="container-fluid">
                <div class="row">
                   
                    <div class="col-12 text-center mb-4">
                    <h2 class="h1">CALÇAS</h2>
                </div>
                 <div class="scroll-container px-2">
                                         

                    <div class="scroll-item">
                        <a href="/produtos/calcas/calca-esporte-fino" class="text-decoration-none">
                            <img src="{{ 'images/cat-33.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">ALFAIATARIA</p>
                        </a>
                    </div>
                    <div class="scroll-item">
                        <a href="/produtos/calcas/calca-jogador" class="text-decoration-none">
                            <img src="{{ 'images/cat-15.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">JOGADOR</p>
                        </a>
                    </div>
                
                     <div class="scroll-item">
                        <a href="/produtos/calcas/calca-jeans" class="text-decoration-none">
                            <img src="{{ 'images/cat-14.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">JEANS</p>
                        </a>
                    </div>
                    {# Item 2 #}
                    
                </div>
            </div>
        </section>
    {% endif %}
	{% if section_select == 'slider' %}
        <section class="custom-categories-home my-4">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-12 text-center mb-4">
                    <h2 class="h1">CALÇADOS</h2>
                </div>
                    
                    <div class="scroll-container px-2">
                    {# Item 1 #}
                    <div class="scroll-item">
                         
                        <a href="/produtos/tenis/tenis1" class="text-decoration-none">
                            <img src="{{ 'images/cat-16.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 1">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">TÊNIS</p>
                        </a>
                    </div>
                    {# Item 2 #}
                    <div class="scroll-item">
                        <a href="/produtos/tenis/chinelo-slide1" class="text-decoration-none">
                            <img src="{{ 'images/cat-17.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                           
                            <p class="text-center font-weight-bold mt-2 text-dark">SLIDE</p>
                        </a>
                    </div>
                    <div class="scroll-item">
                        <a href="/produtos/tenis/chinelo-asuna-2-0-nike1" class="text-decoration-none">
                            <img src="{{ 'images/cat-18.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">ASUNA 2.0</p>
                        </a>
                    </div>
                    
                </div>
            </div>
        </section>
    {% endif %}
	
	{% if section_select == 'slider' %}
        <section class="custom-categories-home my-4">
            <div class="container-fluid">
                <div class="row justify-content-center">
                   <div class="col-12 text-center mb-4">
                    <h2 class="h1">CONJUNTO</h2>
                </div> 
            
                    {# Item 2 #}
                    
                    <div class="col-6 col-md-3 mb-3 px-2">
                        <a href="/produtos/conjunto-dry-fit" class="text-decoration-none">
                            <img src="{{ 'images/cat-20.jpg' | static_url }}"loading="lazy" class="img-fluid rounded shadow-sm" alt="Categoria 2">
                            <div class="overlay-content">
                              <span class="hover-text">VER COLEÇÃO</span>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">CONJUNTO DRY FIT</p>
                        </a>
                    </div>
                    {# Adicione mais 2 colunas se quiser fechar 4 no desktop #}
                </div>
            </div>
        </section>
    {% endif %}
	{% if section_select == 'slider' %}
    <section class="custom-categories-home my-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center mb-4">
                    <h2 class="h1">OUTROS</h2>
                </div>
                
                {# Container ÚNICO para os itens #}
                <div class="scroll-container px-2 d-flex justify-content-center w-100">
                    
                    {# Item 1 - Boné #}
                    <div class="scroll-item">
                        <a href="/produtos/outros/bone" class="text-decoration-none">
                            <div class="img-container">
                                <img src="{{ 'images/cat-22.jpg' | static_url }}" loading="lazy" class="img-fluid rounded shadow-sm custom-img-fit" alt="Boné">
                                <div class="overlay-content">
                                    <span class="hover-text">VER COLEÇÃO</span>
                                </div>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">BONÉ</p>
                        </a>
                    </div>
                    
                    {# Item 2 - Lupas (CORRIGIDO: Sem a div interna extra) #}
                    <div class="scroll-item">
                        <a href="/produtos/outros/lupas" class="text-decoration-none">
                            <div class="img-container">
                                <img src="{{ 'images/cat-24.jpg' | static_url }}" loading="lazy" class="img-fluid rounded shadow-sm custom-img-fit" alt="Lupas">
                                <div class="overlay-content">
                                    <span class="hover-text">VER COLEÇÃO</span>
                                </div>
                            </div>
                            <p class="text-center font-weight-bold mt-2 text-dark">LUPAS</p>
                        </a>
                    </div>

                </div> {# Fim do scroll-container #}
            </div>
        </div>
    </section>
    
  
      <section class="brands-marquee-section my-5">
    <div class="container-fluid">
        <div class="col-12 text-center mb-4">
            <h2 class="h1" style="border-bottom: 2px solid #f0c60c; display: inline-block; padding-bottom: 5px; text-transform: uppercase; font-weight: 700;">
                Nossas Marcas
            </h2>
        </div>
        
        <div class="brands-marquee-container">
            <div class="brands-track">
                {# Lista de Marcas - Fila 1 #}
                <div class="brand-logo"><img src="{{ 'images/nike.jpg' | static_url }}" alt="Marca 1"></div>
                <div class="brand-logo"><img src="{{ 'images/mizuno10.jpg' | static_url }}" alt="Marca 2"></div>
                <div class="brand-logo"><img src="{{ 'images/armani.png' | static_url }}" alt="Marca 3"></div>
                <div class="brand-logo"><img src="{{ 'images/boss.png' | static_url }}" alt="Marca 4"></div>
                <div class="brand-logo"><img src="{{ 'images/lacoste.png' | static_url }}" alt="Marca 5"></div>
                <div class="brand-logo"><img src="{{ 'images/brow.png' | static_url }}" alt="Marca 1"></div>
                <div class="brand-logo"><img src="{{ 'images/zara.png' | static_url }}" alt="Marca 2"></div>
                <div class="brand-logo"><img src="{{ 'images/oakley.png' | static_url }}" alt="Marca 3"></div>
                <div class="brand-logo"><img src="{{ 'images/gucci.jpg' | static_url }}" alt="Marca 4"></div>
                <div class="brand-logo"><img src="{{ 'images/burberry.jpg' | static_url }}" alt="Marca 5"></div>
                <div class="brand-logo"><img src="{{ 'images/cat-1000.png' | static_url }}" alt=arc"Ma 5"></div>
                <div class="brand-logo"><img src="{{ 'images/nike.jpg' | static_url }}" alt="Marca 1"></div>
                <div class="brand-logo"><img src="{{ 'images/mizuno10.jpg' | static_url }}" alt="Marca 2"></div>
                <div class="brand-logo"><img src="{{ 'images/armani.png' | static_url }}" alt="Marca 3"></div>
                <div class="brand-logo"><img src="{{ 'images/boss.png' | static_url }}" alt="Marca 4"></div>
                <div class="brand-logo"><img src="{{ 'images/lacoste.png' | static_url }}" alt="Marca 5"></div>
                <div class="brand-logo"><img src="{{ 'images/brow.png' | static_url }}" alt="Marca 1"></div>
                <div class="brand-logo"><img src="{{ 'images/zara.png' | static_url }}" alt="Marca 2"></div>
                <div class="brand-logo"><img src="{{ 'images/oakley.png' | static_url }}" alt="Marca 3"></div>
                <div class="brand-logo"><img src="{{ 'images/gucci.jpg' | static_url }}" alt="Marca 4"></div>
                <div class="brand-logo"><img src="{{ 'images/burberry.jpg' | static_url }}" alt="Marca 5"></div>
                <div class="brand-logo"><img src="{{ 'images/cat-1000.png' | static_url }}" alt=arc"Ma 5"></div>
                
                
            </div>
        </div>
    </div>
</section>
        <section class="social-proof-home my-5 py-4 bg-dark text-white">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center mb-5">
                <h2 class="h1" style="color: #eeea07; border-bottom: 2px solid #eeea07; display: inline-block; padding-bottom: 5px;">
                    QUEM USA, APROVA
                </h2>
                <p class="mt-2 text-light opacity-75">Confira a opinião de quem já comprou</p>
            </div>

            <div class="scroll-container px-3">
                {# Depoimento 1 #}
                <div class="scroll-item testimonial-box">
                    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
                    <p class="testimonial-text">"O conjunto dry fit é incrível! Tecido leve e entrega muito rápida."</p>
                    <div class="mt-3">
                        <strong class="d-block text-uppercase" style="font-size: 12px;">Marcos Silva</strong>
                        <small class="opacity-50">São Paulo - SP</small>
                    </div>
                </div>

                {# Depoimento 2 #}
                <div class="scroll-item testimonial-box">
                    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
                    <p class="testimonial-text">"As lupas têm uma qualidade absurda. Atendimento nota 10 no Whats."</p>
                    <div class="mt-3">
                        <strong class="d-block text-uppercase" style="font-size: 12px;">Ana Julia</strong>
                        <small class="opacity-50">Rio de Janeiro - RJ</small>
                    </div>
                </div>

                {# Depoimento 3 #}
                <div class="scroll-item testimonial-box">
                    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
                    <p class="testimonial-text">"Comprei o boné e a modelagem é perfeita. Chegou antes do prazo."</p>
                    <div class="mt-3">
                        <strong class="d-block text-uppercase" style="font-size: 12px;">Ricardo O.</strong>
                        <small class="opacity-50">Belo Horizonte - MG</small>
                    </div>
                </div>

{# Depoimento 5 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">"Sem palavras pra essa polo! O caimento ficou top demais e a entrega foi vapt-vupt. Recomendo!"</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Thiago L.</strong>
        <small class="opacity-50">Campinas - SP</small>
    </div>
</div>

{# Depoimento 6 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">"Tava com receio de comprar calça online, mas essa de sarja serviu certinho. Qualidade bruta!"</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Bruno Soares</strong>
        <small class="opacity-50">Goiânia - GO</small>
    </div>
</div>

{# Depoimento 7 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">"O tênis é brabo! Confortável pra caramba e chama atenção por onde passa. Já quero outro kkk."</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Lucas "Panda"</strong>
        <small class="opacity-50">Salvador - BA</small>
    </div>
</div>
{# Depoimento 9 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">"Essa oversized é diferenciada, esquece! O tecido é pesado e não encolhe na lavagem. Estilo puro."</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Vitor Hugo</strong>
        <small class="opacity-50">Vitória - ES</small>
    </div>
</div>

{# Depoimento 10 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">" Ce é louco parça, o kit chegou antes do esperado e a embalagem veio cheirosa, capricho total dos caras. Nota 11!"</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Rodrigo "Japa"</strong>
        <small class="opacity-50">Sorocaba - SP</small>
    </div>
</div>

{# Depoimento 8 - Informal #}
<div class="scroll-item testimonial-box">
    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
    <p class="testimonial-text">"Atendimento dos caras no WhatsApp é diferenciado. Tiraram todas as dúvidas. Compra segura!"</p>
    <div class="mt-3">
        <strong class="d-block text-uppercase" style="font-size: 12px;">Gabriel M.</strong>
        <small class="opacity-50">Porto Alegre - RS</small>
    </div>
</div>
                {# Depoimento 4 #}
                <div class="scroll-item testimonial-box">
                    <div class="stars mb-2" style="color: #eeea07;">★★★★★</div>
                    <p class="testimonial-text">"A calça de alfaiataria veste muito bem. Surpreendido com a qualidade.Os guri são top demais"</p>
                    <div class="mt-3">
                        <strong class="d-block text-uppercase" style="font-size: 12px;">Felipe Dias</strong>
                        <small class="opacity-50">Curitiba - PR</small>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>
    {% endif %}
	
	

	
	
	
	{% endfor %}





	{#  **** Hidden Sections ****  #}
	{% if show_component_help %}
		<div style="display:none">
			{% for section_select in ['slider', 'main_categories', 'products', 'informatives', 'welcome', 'institutional', 'categories', 'promotional', 'news_banners', 'modules', 'brands', 'new', 'video', 'newsletter', 'sale', 'main_product', 'instafeed', 'testimonials'] %}
				{% if section_select not in newArray %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
				{% endif %}
				
			{% endfor %}
		</div>
	{% endif %}
</div>

{% if settings.home_promotional_popup and ("home_popup_image.jpg" | has_custom_image or settings.home_popup_title or settings.home_popup_txt or settings.home_news_box or (settings.home_popup_btn and settings.home_popup_url)) %}
	{% include 'snipplets/home/home-popup.tpl' %}
{% endif %}





<style>
/* Estilização da Seção de Categorias Personalizada */
.custom-categories-home {
    padding: 20px 0;
    margin-bottom:0 !important;
}

/* Título Centralizado */
.custom-categories-home h2.h1 {
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    position: relative;
    padding-bottom: 3px;
    border-bottom: 2px solid #ffffff; /* Cria o tracinho como uma borda */
}


/* Container principal do item */
.scroll-item {
    flex: 0 0 auto;
    width: 160px;
}

.custom-categories-home a {
    position: relative;
    display: block;
    text-decoration: none;
}

/* Container da Imagem para controlar o overflow do zoom */
.img-container {
    position: relative;
    overflow: hidden;
    border-radius: 20px;
    line-height: 0; /* Remove espaços fantasmas abaixo da imagem */
}

.custom-categories-home img {
    transition: all 0.5s ease;
    width: 100%;
    border-radius: 20px;
    display: block;
}

/* Camada de Overlay (Fundo escuro) */
.overlay-content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%; /* Ocupa apenas a área da imagem */
    background: rgba(0, 0, 0, 0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.4s ease;
    border-radius: 20px;
    z-index: 2;
}

/* Texto que aparece no HOVER */
.hover-text {
    color: #eeea07;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    letter-spacing: 1px;
    transform: translateY(10px);
    transition: transform 0.4s ease;
}

/* Texto de BAIXO (Sempre visível) */
.custom-categories-home p {
    opacity:1;
    transition: color 0.3s ease;
    margin-top: 10px;
}

/* --- ESTADOS DE HOVER --- */
.custom-categories-home a:hover p {
    opacity: 0;
    transform: translateY(5px); /* Opcional: ele dá uma leve descidinha enquanto some */
}
/* 1. Efeito na Imagem (Zoom e Blur) */
.custom-categories-home a:hover img {
    transform: scale(1.0);
    filter: blur(3px);
}

/* 2. Mostra o Overlay */
.custom-categories-home a:hover .overlay-content {
    opacity: 1;
   
}

/* 3. Anima o texto do hover subindo */
.custom-categories-home a:hover .hover-text {
    transform: translateY(0);
}

/* 4. Opcional: muda a cor do texto de baixo no hover */
.custom-categories-home a:hover p {
    color: #eeea07 !important;
}

/* Scroll Container */
.scroll-container {
    display: flex;
    overflow-x: auto;
    gap: 15px;
    padding: 10px 0;
    scrollbar-width: none;
}
.scroll-container::-webkit-scrollbar { display: none; }
.img-card-custom {
    width: 100%;
    height: 250px; /* Escolha a altura que preferir */
    object-fit: cover; /* Faz a imagem preencher o espaço sem esticar */
}
/* Estilo específico para os depoimentos */
.testimonial-box {
    background: #1a1a1a; /* Fundo levemente mais claro que o preto total */
    padding: 20px;
    border-radius: 20px;
    width: 260px !important; /* Depoimentos precisam de um pouco mais de largura que as fotos */
    border: 1px solid #333;
    white-space: normal; /* Permite que o texto quebre linha */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.testimonial-text {
    font-size: 14px;
    line-height: 1.5;
    color: #fae100;
    font-style: italic;
    margin-bottom: 0;
}

.stars {
    font-size: 14px;
    letter-spacing: 2px;
}

/* Ajuste para que o scroll lateral funcione bem com os depoimentos */
.social-proof-home .scroll-container {
    padding-bottom: 20px;
}
/* --- AJUSTE PARA DESKTOP (PC) --- */
@media (min-width: 768px) {
    .scroll-container {
        overflow-x: visible; /* Remove o scroll lateral */
        flex-wrap: wrap;     /* Permite que os itens quebrem linha se necessário */
        justify-content: center; /* Centraliza os cards */
        gap: 25px;           /* Aumenta o espaçamento no PC */
    }

    .scroll-item {
        flex: 0 1 calc(20% - 25px); /* Exibe até 5 cards por linha */
        width: auto;         /* Deixa o flex controlar a largura */
        min-width: 200px;    /* Garante que o card não fique pequeno demais */
    }
}
/* Força todas as imagens das categorias a terem o mesmo tamanho */
.custom-img-fit {
    width: 100% !important;
    height: 200px !important; /* Ajuste essa altura como preferir */
    object-fit: cover !important;
    object-position: center;
}

/* Garante a centralização quando há poucos itens */
/* --- AJUSTE PARA DESKTOP (PC) --- */
@media (min-width: 768px) {
    .scroll-container {
        overflow-x: visible; 
        flex-wrap: wrap;     /* Permite quebrar para a segunda linha */
        justify-content: center; 
        gap: 20px;           /* Espaço entre os cards */
    }

    /* Regra geral para itens de categoria (5 por linha) */
    .scroll-item {
        flex: 0 1 calc(20% - 20px); 
        min-width: 180px;
    }

    /* Regra ESPECÍFICA para os depoimentos ficarem 5 em cada linha */
    .social-proof-home .scroll-item.testimonial-box {
        flex: 0 1 calc(20% - 20px) !important; /* Força 5 por linha (100% / 5 = 20%) */
        width: auto !important;
        min-width: 200px; /* Garante que o box não fique espremido */
        margin-bottom: 15px; /* Espaço entre a linha de cima e a de baixo */
    }
}
/* --- ESTILO CARROSSEL DE MARCAS INFINITO --- */

.brands-marquee-container {
    overflow: hidden;
    width: 100%;
    background: #000000;
    padding: 20px 0;
    position: relative;
    /* Adiciona uma máscara suave nas laterais (opcional, fica bem profissional) */
    -webkit-mask-image: linear-gradient(to right, transparent, black 10%, black 90%, transparent);
    mask-image: linear-gradient(to right, transparent, black 10%, black 90%, transparent);
}

.brands-track {
    display: flex;
    width: max-content;
    flex-wrap: nowrap;
    /* will-change avisa o navegador para carregar os itens antes deles aparecerem */
    will-change: transform; 
    animation: scroll-brands 60s linear infinite;
}

.brand-logo {
    /* Define um tamanho fixo para a caixa, garantindo que o espaço exista */
    width: 200px; 
    height: 80px;
    margin-right: 50px; /* Espaço entre as marcas */
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.brand-logo img {
    max-width: 200px;
    max-height: 200px;
    width: max-content; /* Garante que a div tenha a largura de todos os logos somados */    
    height: auto;
    object-fit: contain;
    /* Garante que a imagem esteja "visível" para o navegador carregar */
    backface-visibility: hidden; 
}

/* Animação sem saltos e sem delay */
@keyframes scroll-brands {
    0% {
        transform: translate3d(0, 0, 0);
    }
    100% {
        /* Move exatamente metade do conteúdo duplicado */
        transform: translate3d(-100%, 0, 0);
    }
}







/* Barra de Vantagens */
.trust-bar {
    background: #000; /* Fundo preto para contrastar com o banner */
    padding: 15px 0;
    border-bottom: 2px solid #eeea07; /* Linha amarela igual aos depoimentos */
}

.trust-wrapper {
    display: flex;
    justify-content: space-around;
    align-items: center;
    overflow-x: auto;
    gap: 20px;
    padding: 0 10px;
}

/* Esconder barra de scroll no Chrome/Safari */
.trust-wrapper::-webkit-scrollbar { display: none; }

.trust-item {
    display: flex;
    align-items: center;
    cursor: pointer;
    min-width: max-content;
    transition: transform 0.2s;
}

.trust-item:hover { transform: scale(1.05); }

.trust-icon {
    font-size: 1.5rem;
    margin-right: 10px;
}

.trust-text strong {
    display: block;
    color: #eeea07; /* Amarelo destaque */
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.trust-text span {
    color: #fff;
    font-size: 0.65rem;
    opacity: 0.8;
}

/* Modal Minimalista */
.modal-overlay {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,0.8);
    justify-content: center; align-items: center;
}

.modal-content {
    background: #fff;
    padding: 40px 20px;
    border-radius: 4px; /* Mais quadrado, estilo streetwear */
    max-width: 400px;
    width: 85%;
    text-align: center;
    position: relative;
    border-top: 8px solid #eeea07;
}

.close-modal {
    position: absolute;
    top: 10px; right: 15px;
    font-size: 30px; cursor: pointer; color: #000;
}
.music-player {
    position: fixed;
    bottom: 20px;
    left: 20px;
    background: #000;
    border: 2px solid #eeea07;
    border-radius: 50px;
    padding: 8px 15px;
    z-index: 9999;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
}

.music-player:hover {
    transform: scale(1.05);
    background: #111;
}

.music-icon {
    font-size: 1.2rem;
    margin-right: 8px;
}


/* Animação quando a música está tocando */
.playing {
    box-shadow: 0 0 15px #eeea07;
}











</style>

<script>
const audio = document.getElementById('bg-audio');
const player = document.getElementById('music-player');
const icon = document.getElementById('music-icon');
const text = document.getElementById('music-text');

function toggleMusic() {
    if (audio.paused) {
        audio.play();
        player.classList.add('playing');
        icon.innerText = '🔊';
        text.innerText = 'ON BEAT';
    }
     else {
        audio.pause();
        player.classList.remove('playing');
        icon.innerText = '🔇';
        text.innerText = 'PAUSED';
    }
}

// Tenta tocar automaticamente ao primeiro clique no site (Contorna bloqueio do Chrome)
document.body.addEventListener('click', function() {
    if (audio.paused && !player.classList.contains('manually-paused')) {
        // Opcional: descomente a linha abaixo se quiser que comece sozinho no primeiro clique
        // toggleMusic(); 
    }
}, { once: true });

const wrapper = document.querySelector('.player-cards-wrapper');
const btnLeft = document.querySelector('.left-btn');
const btnRight = document.querySelector('.right-btn');

btnLeft.addEventListener('click', () => {
    wrapper.scrollBy({ left: -250, behavior: 'smooth' });
});

btnRight.addEventListener('click', () => {
    wrapper.scrollBy({ left: 250, behavior: 'smooth' });
});

</script>