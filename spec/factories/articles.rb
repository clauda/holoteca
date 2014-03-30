FactoryGirl.define do
  factory :article do
    title 'Lorem ipsum'
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus, modi aspernatur illum rem facilis doloremque architecto. Vitae, voluptates, molestias, inventore, nihil officiis quam beatae vel ad quod eveniet placeat commodi non quia in obcaecati saepe dicta asperiores. Dicta, rerum harum quo earum dignissimos unde quae a tempora amet cumque non cupiditate necessitatibus nesciunt. Animi, voluptatem, id ut sint quas beatae corporis dolore qui sit nobis eius eos. Voluptatibus, rem, facilis, magnam eum unde doloribus ab incidunt aliquam accusantium ducimus velit vero cupiditate deleniti quidem soluta adipisci temporibus nesciunt minima aliquid optio provident excepturi nemo fugiat debitis repellendus facere qui? Animi, eius, provident nostrum illum vero facere magnam deleniti earum dignissimos necessitatibus. Ipsam, ab, natus, consequatur, mollitia doloremque fuga labore et inventore facere tenetur cumque est culpa beatae corporis quaerat placeat voluptates perspiciatis qui eveniet illo. Distinctio, itaque, sit, doloremque impedit obcaecati sequi at culpa aperiam illum dolores vero dolorum enim saepe maxime in excepturi earum sapiente veritatis! Fuga, deleniti facilis facere laborum saepe illum consequatur omnis officiis aperiam molestiae! Expedita, pariatur, sapiente, earum minima dicta quos reiciendis eaque adipisci cum accusantium quidem error saepe magnam molestiae est hic quia qui voluptates modi esse libero natus itaque. Ad, neque earum deleniti.'
    published false
    published_at Time.now
    summary 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel, incidunt, maiores, dolorem molestiae repellendus sapiente consequatur voluptatibus veniam soluta sit dicta a tempora ex aut quasi quidem quia iusto quisquam!'
    permalink 'lorem-ipsum'
    association :author, factory: :user
    category
  end
end
