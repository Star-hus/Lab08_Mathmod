model Lab08

parameter Real p_cr = 12; //Критическая стоимость продукта
  parameter Real N = 40; //Число потребителей производимого продукта
  parameter Real q = 1; //Максимальная потребность одного человека в продукте в единицу времени
  parameter Real tau_1 = 20; //Длительность производственного цикла фирмы 1
  parameter Real tau_2 = 30; //Длительность производственного цикла фирмы 2
  parameter Real p_1 = 8; // Себестоимость продукта у фирмы 1
  parameter Real p_2 = 5; // Себестоимость продукта у фирмы 2
  
  parameter Real M1_0 = 5; //Оборотные средства 1-ого предприятия в начальный момент времени
  parameter Real M2_0 = 4.5; //Оборотные средства 2-ого предприятия в начальный момент времени
  
  parameter Real a1 = p_cr / (tau_1 * tau_1 * p_1 * p_1 * N * q);
  parameter Real a2 = p_cr / (tau_2 * tau_2 * p_2 * p_2 * N * q);
  parameter Real b = p_cr / (tau_1 * tau_1 * p_1 * p_1 *tau_2 * tau_2 * p_2 * p_2 * N * q);
  parameter Real c1 = (p_cr - p_1) / (tau_1 * p_1);
  parameter Real c2 = (p_cr - p_2) / (tau_2 * p_2);
  
  Real M1(start = M1_0); //Оборотные средства фирмы 1
  Real M2(start = M2_0); //Оборотные средства фирмы 2
  

equation
//Для первого случая с экономическим фактором влияния
der(M1) = M1 - (b/c1)*M1*M2 - (a1/c1)*M1*M1;
der(M2) = (c2/c1)*M2 - (b/c1)*M1*M2 - (a2/c1)*M2*M2;

//Для второго случая с экономическими факторами влияния + социально-психологическими факторами влияния
//der(M1) = M1 - (b/c1)*M1*M2 - (a1/c1)*M1*M1;
//der(M2) = (c2/c1)*M2 - ((b/c1)+0.0002)*M1*M2 - (a2/c1)*M2*M2;
end Lab08;
