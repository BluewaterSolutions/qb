import qb.models.Query.QueryBuilder;

component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "MySQL Grammar", function() {
            it( "correctly wraps values for MySQL", function() {
                var builder = getBuilder();
                builder.select( "name" ).from( "users" );
                expect( builder.toSql() ).toBe( "SELECT `name` FROM `users`" );
            } );
        } );
    }

    private QueryBuilder function getBuilder() {
        var grammar = getMockBox()
            .createMock( "qb.models.Grammars.MySQLGrammar" );
        var queryUtils = getMockBox()
            .createMock( "qb.models.Query.QueryUtils" );
        var builder = getMockBox().createMock( "qb.models.Query.QueryBuilder" )
            .init( grammar, queryUtils );
        return builder;
    }

    private array function getTestBindings( required QueryBuilder builder ) {
        return builder.getBindings().map( function( binding ) {
            return binding.value;
        } );
    }

}