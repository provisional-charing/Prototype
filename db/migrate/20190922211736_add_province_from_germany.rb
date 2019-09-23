class AddProvinceFromGermany < ActiveRecord::Migration[5.0]

    def up
      from_shp_sql =`shp2pgsql -c -g geom -W LATIN1 -s 4326 C:\\shpfiles\\GERMANY\\gadm36_DEU_1.shp province_ref`
      #hier for loop für jedes shp-file
      #  insert into provinces(country_name, province_name, geom) values('#{country}', '#{region}', select geom from province_ref )

      #value = "C:\\shpfiles\\Agypten_AlexandriaGovernorate-polygon.shp"
      #if value.is_a? String
      # country, region = value.scan(/.*\\(\w+)_(\w+)-.*/).flatten
      #end


      Province.transaction do
        execute from_shp_sql

        execute <<-SQL
          insert into provinces(country_name, province_name, geom)  select name_0, name_1, geom from province_ref  

        SQL

        drop_table :province_ref
      end

    end

    def down
      Province.delete_all
    end
end
