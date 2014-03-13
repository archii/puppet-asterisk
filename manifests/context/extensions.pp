define asterisk::context::extensions (
  $ensure  = present,
  $source  = false,
  $content = false
) {

  if $source {
    asterisk::dotd_file {"${name}.conf":
      ensure   => $ensure,
      dotd_dir => 'extensions.d',
      source   => $source,
    }
  } else {
    if $content {
      asterisk::dotd_file {"${name}.conf":
        ensure   => $ensure,
        dotd_dir => 'extensions.d',
        content  => "[${name}]\n${content}",
      }
    } else {
      fail('source or content parameter is required')
    }
  }

}
