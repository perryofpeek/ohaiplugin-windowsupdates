#
# Author:: Owain Perry (<perry@peek.org.uk>)
# Copyright:: Copyright (c) 2013 PerryOfPeek
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require 'win32ole'
provides 'windows_updates/updates'

windows_updates Mash.new unless windows_updates
windows_updates[:updates] = Mash.new unless windows_updates[:updates]

wmi = WIN32OLE.connect("winmgmts://")
updates_list = wmi.ExecQuery("select * from win32_quickfixengineering")

updates_list.each do |update| 
	windows_updates[:updates][update.HotFixID] = update.InstalledOn
end
