module Ext4

  # ////////////////////////////////////////////////////////////////////////////
  # // Data definitions.

  EX_ATTRIB_HEADER = [
    'L',  'signature',  # Always 0xea020000
    'L',  'ref_count',
    'L',  'num_blks',
    'L',  'hash',
  ]

  class ExAttribHeader
  end
end
