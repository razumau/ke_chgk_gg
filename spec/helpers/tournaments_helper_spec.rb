require './spec/rails_helper'

describe TournamentsHelper do
  let(:dummy_class) { Class.new { extend TournamentsHelper } }
  let(:chgk_editors) { [EditorDetails.new(stage: 1, name: "Михаил Малкин"),
                        EditorDetails.new(stage: 4, name: "Михаил Малкин"),
                        EditorDetails.new(stage: 2, name: "Алексей Полевой"),
                        EditorDetails.new(stage: 2, name: "Наиль Фарукшин"),
                        EditorDetails.new(stage: 3, name: "Александр Кудрявцев"),
                        EditorDetails.new(stage: 3, name: "Станислав Мереминский"),
                        EditorDetails.new(stage: 3, name: "Евгений Миротин")] }

  it 'displays chgk editors' do
    text = "Михаил Малкин (туры 1, 4), Алексей Полевой и Наиль Фарукшин (2-й тур), Александр Кудрявцев, Станислав Мереминский и Евгений Миротин (3-й тур)."
    expect(dummy_class.display_chgk_editors(chgk_editors)).to eq(text)
  end

  it 'displays single editor' do
    single_editor_for_all = [EditorDetails.new(stage: 1, name: "Михаил Малкин"),
                             EditorDetails.new(stage: 2, name: "Михаил Малкин"),
                             EditorDetails.new(stage: 3, name: "Михаил Малкин")]
    expect(dummy_class.display_chgk_editors(single_editor_for_all)).to eq("Михаил Малкин")
  end

  it 'collects all tours for group' do
    collected = {"Михаил Малкин"=>%w[1 4],
                 "Алексей Полевой и Наиль Фарукшин"=>["2"],
                 "Александр Кудрявцев, Станислав Мереминский и Евгений Миротин"=>["3"]}
    expect(dummy_class.collect_all_by_editor_group(chgk_editors)).to eq(collected)
  end

  it 'groups by tour' do
    grouped = dummy_class.group_by_stage(chgk_editors)
    expect(grouped).to eq({
                            "1"=>["Михаил Малкин"],
                            "2"=>["Алексей Полевой", "Наиль Фарукшин"],
                            "3"=>["Александр Кудрявцев", "Станислав Мереминский", "Евгений Миротин"],
                            "4"=>["Михаил Малкин"]
                          })
  end
end