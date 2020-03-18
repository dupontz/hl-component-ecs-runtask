CfhighlanderTemplate do

  DependsOn 'lib-iam@0.1.0'
  DependsOn 'lib-ec2@0.1.0'
  
  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', isGlobal: true

    ComponentParam 'SubnetIds', type: 'CommaDelimitedList'

    ComponentParam 'EcsCluster'
  end

  #Pass the all the config from the parent component to the inlined component
  Component template: 'ecs-task@secrets', name: "#{component_name.gsub('-','').gsub('_','')}Task", render: Inline, config: @config 

end