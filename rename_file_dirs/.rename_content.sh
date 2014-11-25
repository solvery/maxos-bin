
grep -r -l pcard_adc_ctrl * | xargs sed -i "s/pcard_adc_ctrl/$1/g"

