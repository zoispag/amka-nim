import unittest

import amka

test "it validates valid amka":
    let (is_valid, err) = validate("09095986684")
    check is_valid == true


test "it fails when not a number":
    let (is_valid, err) = validate("asvs")
    check is_valid == false


test "it fails when short number":
    let (is_valid, err) = validate("09095986")
    check is_valid == false


test "it fails when long number":
    let (is_valid, err) = validate("090959866845")
    check is_valid == false


test "it fails when not a valid date":
    let (is_valid, err) = validate("39095986681")
    check is_valid == false


test "it fails with bad checkdigit":
    let (is_valid, err) = validate("09095986680")
    check is_valid == false


