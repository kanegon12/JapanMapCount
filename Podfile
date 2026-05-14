# Uncomment the next line to define a global platform for your project
platform :ios, '18.0'

target 'JapanMapCount' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift', :inhibit_warnings => true # Realm内部のC++警告を抑制
  pod 'Google-Mobile-Ads-SDK'

  target 'JapanMapCountTests' do
    inherit! :search_paths
    pod 'RealmSwift', :inhibit_warnings => true
  end

  # Pods for JapanMapCount


end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # 複数のPodが同じライブラリ（-lc++など）を重複してリンクしないよう除去する
      other_ldflags = config.build_settings['OTHER_LDFLAGS']
      if other_ldflags.is_a?(Array)
        config.build_settings['OTHER_LDFLAGS'] = other_ldflags.uniq
      elsif other_ldflags.is_a?(String)
        config.build_settings['OTHER_LDFLAGS'] = other_ldflags.split(' ').uniq.join(' ')
      end
    end

    # 'Create Symlinks to Header Folders' の警告を解消する
    # 出力ファイル未指定のスクリプトは「毎回実行する」と明示することで警告が消える
    target.build_phases.each do |phase|
      if phase.respond_to?(:name) && phase.name == 'Create Symlinks to Header Folders'
        phase.always_out_of_date = "1"
      end
    end
  end
end
