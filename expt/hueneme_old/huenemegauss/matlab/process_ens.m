dim = 30;
time = 0:2:950;

for ens_num = 238:360



gaugeno = [1];
num_gauges = size(gaugeno,2);
for j=1:num_gauges
    
    datafilename = ['/home/will/clawpack_src/clawpack-v5.4.1/geoclaw/examples/tsunami/huenemegauss/ENS_DATA_' num2str(dim) '/data_g' num2str(gaugeno(j),'%02d') '_n' num2str(ens_num) '.mat'];
    load(datafilename)
    
%    refdatafilename = ['/home/will/clawpack_src/clawpack-v5.4.1/geoclaw/examples/tsunami/hueneme/GF_DATA_' num2str(dim) '/ref_data_g' num2str(gaugeno(j),'%02d') '.mat'];
%    load(refdatafilename)
   
    %create timeseries
    ugts = timeseries(u_g, t_g);
    vgts = timeseries(v_g, t_g);
    etagts = timeseries(eta_g, t_g);
    
    ugts_out = resample(ugts, time);
    vgts_out = resample(vgts, time);
    etagts_out = resample(etagts, time);
    
%     uts = timeseries(u, t);
%     vts = timeseries(v, t);
%     etats = timeseries(eta, t);
%     
%     uts_out = resample(uts, time);
%     vts_out = resample(vts, time);
%     etats_out = resample(etats, time);    
    
%     figure
%     plot((1:3:1800)',etagts_out.Data - etats_out.Data)
%     hold on
   % plot(t_g,u_g - u(1:1545))
   % plot(t(1:1545),u_g - u(1:1545))
%     

%     figure
%     plot(etagts_out)
%     hold on
%     plot(t_g,eta_g)
%     figure
%     plot(etats_out)
%     hold on
%     plot(t,eta)
%     legend
    

    u_e = ugts_out.Data;
    v_e = vgts_out.Data;
    eta_e = etagts_out.Data;
    
%     ur = uts_out.Data;
%     vr = vts_out.Data;
%     etar = etats_out.Data;

    datafilename = ['/home/will/clawpack_src/clawpack-v5.4.1/geoclaw/examples/tsunami/huenemegauss/ENS_DATA_' num2str(dim) '/p_data_g' num2str(gaugeno(j),'%02d') '_n' num2str(ens_num) '.mat'];
    save(datafilename,'time','u_e','v_e','eta_e')
%    refdatafilename = ['/home/will/clawpack_src/clawpack-v5.4.1/geoclaw/examples/tsunami/hueneme/GF_DATA_' num2str(dim) '/ref_data_g' num2str(gaugeno(j),'%02d') '.mat'];
%    save(refdatafilename,'time','ur','vr','etar')

end

end