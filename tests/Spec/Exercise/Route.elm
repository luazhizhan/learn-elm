module Spec.Exercise.Route exposing (suite)

import Exercise.Route exposing (Route(..), toRoute)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "toRoute"
        [ test "/" <| \_ -> Expect.equal Home (toRoute "/")
        , test "/index" <| \_ -> Expect.equal Home (toRoute "/index")
        , test "/about-us" <| \_ -> Expect.equal AboutUs (toRoute "/about-us")
        , test "/topic/general" <| \_ -> Expect.equal (Topic "general") (toRoute "/topic/general")
        , test "/blog/123" <| \_ -> Expect.equal (Blog 123) (toRoute "/blog/123")
        , test "/user/cindy-wee" <| \_ -> Expect.equal (User "cindy-wee") (toRoute "/user/cindy-wee")
        , test "/user/cindy-wee/comment/2" <| \_ -> Expect.equal (Comment "cindy-wee" 2) (toRoute "/user/cindy-wee/comment/2")
        , test "/404" <| \_ -> Expect.equal Home (toRoute "/index")
        ]
