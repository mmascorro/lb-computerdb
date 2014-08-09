task :puma do
  `puma -b tcp://0.0.0.0:9200 -e production -d`
end
