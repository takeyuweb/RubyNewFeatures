module MyModule
  OLD_CONSTANT_1 = 'OLD1'
  OLD_CONSTANT_2 = 'OLD2'
  NEW_CONSTANT = 'NEW'

  deprecate_constant(:OLD_CONSTANT_1, :OLD_CONSTANT_2)
end

p MyModule::OLD_CONSTANT_1
p MyModule::OLD_CONSTANT_2
p MyModule::NEW_CONSTANT

