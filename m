Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2ZsOe3oLjYWTb/bYIsar2p/vrCnOBD+QcVL5UXwU8+A=;
        b=UqTogkWKXr3AEugCpgef9ySFDNMAyAASRyiB2LkDhfguLIN6vLf+a1yroaVaPYiVK2
         qbsMSgUBjULlilVeA20s6sesPzXwgbkzoQMe6LaFKt5oSmzFAhkpv5r/BV0vzY8iwSs/
         8L5LlUoHmCUD/anCSGGHA64vhUbqnH0XO8HpY9yb0GJz9lQ0A0nnXLdUE9p/3s06pEs5
         EkORyCAOzzZKoLRoQ6gKBsEKGhKz8quMrXRfMpulEVtRVL2iGWjcEOwPAx4axOhqGa1R
         OSw8Xqsrdq4MLfD/MVv/AwS7P+tcGxiHLvqt4goA8IehXUKFlGoK315zPIaHmBpHA0QN
         jGJQ==
Subject: [PATCH -perfbook 07/11] cleverefcheck: Check lower-case word after
 \item
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5612690c-47ab-1014-57c2-24ccb94d1d06@gmail.com>
Date: Tue, 17 Aug 2021 19:33:30 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also detect raw "(1)" or "(a)" comes after a colon.
Inline enumerate list should be used instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index c59e42d1..06d4928a 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -75,6 +75,9 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*^\s*\\item\s+[a-z]/ ) {
+	    $safe = 0;
+	}
 	if ($new_sentence) {
 	    if ($line =~ /^\s*`*[a-z]/ || $line =~ /^\s*\\acr/ ||
 		$line =~ /^\s*\\IX[^A\{]*\{[a-z]/ ) {
@@ -82,7 +85,7 @@ sub check_line {
 	    }
 	}
 	if ($new_sentence == 2) { # after colon
-	    if ($line =~ /^\s*\([0-9a-z]\)[\s~][a-z]/ ) {
+	    if ($line =~ /^\s*\([0-9a-z]+\)/ ) {
 		$safe = 0;
 	    }
 	}
-- 
2.17.1


