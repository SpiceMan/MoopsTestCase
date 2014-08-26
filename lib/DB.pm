use Moops;

class DB extends DBIx::Class::Schema using Moose {
    use MooseX::MarkAsMethods autoclean => 1;

    __PACKAGE__->load_namespaces;
}

1;

