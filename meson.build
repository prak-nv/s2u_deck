project('stage2unstage_deck')

fs = import('fs')

dot_cmd = find_program('dot')

dot_inputs_3s = [
  'batch_deps.dot',
  'batch.dot',
  'pipelined_p1.dot',
  'pipelined_p2.dot',
  'pipelined_p3.dot',
  'pipelined_p4.dot',
  'simple_order.dot',
  'stages.dot'
]

dot_inputs_u = [
  'batch_u_deps.dot'
]

dot_in_paths = []
png_names = []
svg_names = []

foreach f : dot_inputs_3s
  dot_in_paths += ['src'/'dot'/'3_stages'/f]
  png_names += fs.replace_suffix(f, '.png')
  svg_names += fs.replace_suffix(f, '.svg')
  #message(dot_in_paths[-1])
  #message(png_names[-1])
  #message(svg_names[-1])
endforeach

foreach f : dot_inputs_u
  dot_in_paths += ['src'/'dot'/'unstaged'/f]
  png_names += fs.replace_suffix(f, '.png')
  svg_names += fs.replace_suffix(f, '.svg')
endforeach

assert(dot_in_paths.length() == png_names.length(), 'len mismatch')
assert(dot_in_paths.length() == svg_names.length(), 'len mismatch')

foreach i : range(dot_in_paths.length())
  #message(i.to_string())
  custom_target('dot2png_' + i.to_string(),
    build_by_default: true,
    command: [dot_cmd, '-Tpng', '@INPUT@'],
    capture: true,
    input: files(dot_in_paths.get(i)),
    output: png_names.get(i),
    install_dir: 'www/png',
    install: true,
    install_tag: 'png'
  )

  custom_target('dot2svg_' + i.to_string(),
    build_by_default: true,
    command: [dot_cmd, '-Tsvg', '@INPUT@'],
    capture: true,
    input: files(dot_in_paths.get(i)),
    output: svg_names.get(i),
    install_dir: 'www/svg',
    install: true,
    install_tag: 'svg'
  )
endforeach

install_data(files('deck.md'),
  install_dir: 'www',
  install_tag: 'Markdown'
)
