Vim�UnDo� P ��*:�����)�\�B�5����nx��   2                                   R�w�    _�                     1        ����                                                                                                                                                                                                                                                                                                                            1          K          V       R�w�     �   0   1            describe '#add_device' do   !    it 'adds device to a user' do   &      user = FactoryGirl.create(:user)   H      SettingsController.any_instance.stubs(:current_user).returns(user)       <      post add_device_settings_path(device_token: "1234abc")       %      response.status.must_equal(200)   :      user.devices.first.device_token.must_equal "1234abc"       end     end         describe "#remove_device" do       it 'removes a device :)' do   &      user = FactoryGirl.create(:user)   H      SettingsController.any_instance.stubs(:current_user).returns(user)              device_token = "ios666mac"   5      user.devices.create(device_token: device_token)       A      user.devices.map(&:device_token).must_include(device_token)   D      delete remove_device_settings_path(device_token: device_token)       $      response.status.must_equal 200   H      user.devices.reload.map(&:device_token).wont_include(device_token)       end     end5�_�                     0        ����                                                                                                                                                                                                                                                                                                                            1          1          V       R�w�    �   /   0           5��