use Moops;

class DB::Result::Foo extends DBIx::Class::Core using Moose {
    use MooseX::NonMoose;
    use MooseX::MarkAsMethods autoclean => 1;
    use DateTime;
    use utf8;

    __PACKAGE__->table("foo");
    __PACKAGE__->add_columns(
        "id", { data_type => "integer", extra => { unsigned => 1 }, is_auto_increment => 1, is_nullable => 0 },
        "user", { date_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
        "create_date", { data_type => "timestamp", datetime_undef_if_invalid => 1, default_value => \"current_timestamp", is_nullable => 0, timezone => "Asia/Tokyo", locale => "ja_JP" },
    );

    __PACKAGE__->set_primary_key("id");

    __PACKAGE__->load_components(qw/TimeStamp InflateColumn::DateTime/); 

    fun to_timestamp( DateTime $dt ) {
        $_[0]->epoch();
    }

    fun from_timestamp( $ts ) {
        return $ts if ref($ts) eq "DateTime";
        return undef if $ts !~ /^\d+$/;

        DateTime->from_epoch( epoch => $_[0], time_zone => timezone(), locale => locale() );
    }

}

1;

