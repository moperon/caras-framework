# Copyright 2017 Global Security Experts Inc.
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
class CreateEvidences < ActiveRecord::Migration[5.1]
  def self.up
    create_table :evidences do |t|
      t.belongs_to :site, index: true, null: false
      t.belongs_to :host, index: true, null: true
      t.belongs_to :port
      t.belongs_to :vulnerability, index: true
      t.string :title, null: false
      t.string :payload
      t.string :data

      t.timestamps null: false
    end
    add_foreign_key :evidences, :sites
    add_foreign_key :evidences, :hosts
    add_foreign_key :evidences, :ports
    add_foreign_key :evidences, :vulnerabilities
  end

  def self.down
    drop_table :evidences
  end
end
