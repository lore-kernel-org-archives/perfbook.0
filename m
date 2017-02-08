Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BmknZXI1Aav8uk2Cgx49yC1awWhSmPQtF2vjbRp4Urk=;
 b=RZBuU4ycPgHPZykAhRYCull8F6KlNOQvUA8Qdh6uQEGsfYrE9uKgUcBav0ofiLjvsi
 hh1lmGX3hv0q9FLhn0LY5rI0EboVS5dZJOReaspjlEBW/gjGxz0FC4QTFFYXxY8tgeAa
 E0cYgw5Dy5TZkfQYlfUE5OsXu84PBnkgSqOxIDyeRDhqKz3HmjgceQbTPd4C56lyB1Ps
 7yJ40gzVt8GXjWMj+8rpBesLfixXwTdeVzTFzE9PVBYrodleKvsPN1KvpW4lO8AhEw2m
 zh6ZSslekKEPsYJZyIO7U4oCvY4gbUhS8Ls0DSUssFpZ9LEDkN/0k0Q50oJ3nt4QsCOa
 9bsA==
Subject: [PATCH 5/5] alphapf.bst: Make use of 'location' field in
 'inproceedings' entry
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a458ef14-16b6-c614-0896-b74703a223aa@gmail.com>
Date: Thu, 9 Feb 2017 00:02:06 +0900
MIME-Version: 1.0
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Jan 2017 00:57:29 +0900
Subject: [PATCH 5/5] alphapf.bst: Make use of 'location' field in 'inproceedings' entry

In early "inproceedings" entries, "address" fields are used to
indicate the location of conferences (by Paul's convention).
In recent entries such as those copied from e.g. ACM BiBTeX templates,
"address" fields are used for publisher's addresses. In such
entries, "location" fields are used to show where those events were
held.

This commit therefore adds awareness of "location" field in
alphapf.bst for "inproceedings" entry, and lets the field have
a higher precedence than an "address" field.

This commit also adds comment in the header describing changes made
for perfbook.

Note: It is easier to see the diff with white-space changes ignored.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 alphapf.bst | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/alphapf.bst b/alphapf.bst
index 6a9ec4d..468d01a 100644
--- a/alphapf.bst
+++ b/alphapf.bst
@@ -6,6 +6,15 @@
 %%% Added DOI support.
 %%% Added PUBMED support.
 %%% Added hyperref support.
+%%%
+%%% Also modified by Akira Yokosawa <akiyks@gmail.com> for perfbook.
+%%% (marked with "% ay")
+%%% Brought date field of unpublished entry in front of note field.
+%%% (In perfbook, note field is mostly used for URL info.)
+%%% Added support of location field in inproceedings entry.
+%%% If "location" is available, it is used instead of "address".
+%%% Copyright (C) 2016, 2017 Akira Yokosawa.
+%%%
 %%% Original headers follow...

 % BibTeX standard bibliography style `alpha'
@@ -46,6 +55,7 @@ ENTRY
     pubmed % urlbst
     url % urlbst
     lastchecked % urlbst
+    location %ay
   }
   {}
   { label extra.label sort.label }
@@ -1022,19 +1032,28 @@ FUNCTION {inproceedings}
       format.bvolume output
       format.number.series output
       format.pages output
-      address empty$
-        { organization publisher new.sentence.checkb
-          organization output
-          publisher output
-          format.date "year" output.check
-        }
-        { address output.nonnull
-          format.date "year" output.check
-          new.sentence
-          organization output
-          publisher output
-        }
-      if$
+      location empty$        %ay
+	{ address empty$     %ay
+	  { organization publisher new.sentence.checkb
+            organization output
+            publisher output
+            format.date "year" output.check
+          }
+            { address output.nonnull
+              format.date "year" output.check
+              new.sentence
+              organization output
+              publisher output
+	    }
+	  if$
+	}                                 % ay
+        { location output.nonnull         % ay
+          format.date "year" output.check % ay
+          new.sentence                    % ay
+          organization output             % ay
+          publisher output                % ay
+        }                                 % ay
+      if$                                 % ay
     }
     { format.incoll.inproc.crossref output.nonnull
       format.pages output
@@ -1187,7 +1206,7 @@ FUNCTION {unpublished}
   new.block
   title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
   format.title "title" output.check
-  format.date output
+  format.date output        % ay
   new.block
   note "note" output.check
   fin.entry
-- 
2.7.4


