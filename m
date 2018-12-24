Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=GeymWravXh0WMX2EpTGKryaLUGttmNUMXizO65P2hN8=;
        b=MJ7lvItkAQODL9M8eLomuav1TDAZjX3sQfzX2pshYU+QCfy67OHk1SJHjpn9xZTf6b
         DMJZMrHWivK/pDY2QRUyIkSvHGFuy0kfunKKEIJMRM7d/NYU1n9e//XNg3sNDBImWWjJ
         dSa6cAvwgUWVlwGtj4p2zsn6wCppbIPcjPuDsOPi8RrdqNVIjK31/XOj1/9UB9RFBEjh
         eK3wpi+9b/EDxunhSGXGh5jwE6lVt1UsfwYEop3E/2hQUiTIu+s/Wt9Je+OgS93zOTNK
         7FRtRy+3cWJ/vh0JZQPGStZ4LLUD6ZRrxRYwoO38OH/OobWa8wvNz/FEBdzjYbUxMpsV
         VKwQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 00/11] datastruct: Employ new scheme for code snippet
Message-ID: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Date: Mon, 24 Dec 2018 23:46:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set consists of enhancement of fcvextract.pl,
update of snippets in datastruct, and some minor tweaks.

fcvextract.pl now suppresses comment blocks in C source and
supports alternative code for snippets in #ifndef blocks,
which won't be affected by the suppression of comment blocks.

Also, labeling of the form /* \lnlbl{label} */ is now supported
in C snippets.

Patch #1 adds comment block handling to fcvextract.pl, without
changing the default behavior.

Patch #2 adds a couple of explicit options to snippets which
have comments to be displayed. It also converts alternative
code fragments using "#ifndef FCV_EXCLUDE" so that they survive
comment block suppression.

Patch #3 changes the default to "keepcomment=no".
This removes a couple of comments in Listings 4.8 and 9.5.

Patch #4 removes now redundant "\fcvexclude" around comment
blocks. It also uses "#ifndef FCV_SNIPPET" to reduce \fcvexclude
uses.

Patch #5 adds support of "/* \lnlbl{label} */" labeling.

Patch #6 updates snippets of hash_bkt.c. "struct hashtab"
now has the "ht_cmp" field and I updated the text to mention
it. You might want to do some rewording.

Patch #7 adds the "ht_cmp" field in the hashdiagram figure
(still in .fig).

Patch #8 updates the rest of snippets in datastruct. It also
fixes typo in cross references of Listing 10.13.
By this change, an smp_mb() appears in ht_get_bucket()
(Listing 10.10).

My guess is that the counterpart barrier is the first
synchronize_rcu() in hashtab_resize(). It might deserve some
explanation or a Quick Quiz.  Also, Answer to Quick Quiz 10.13
might need some expansion, since it looks as though hash_reorder.c
used something more than the pure RCU protection. But I might be
completely misreading here...

Patches #9 and #10 are minor tweaks in appearance of
Listing 10.13. As you can see, tab-space width can be
adjusted per snippet.

Patch #11 permits more chances of hyphenation.

I'm thinking of globally widening tab space of snippets for
1C layout.  Let me do some experiment.

        Thanks, Akira
--
Akira Yokosawa (11):
  fcvextract.pl: Enhance comment block handling of C source
  CodeSamples: Add explicit 'keepcomment=yes' options
  fcvextract.pl: Make 'keepcomment=no' as default
  CodeSamples: Remove redundant \fcvexclude
  fcvextract.pl: Support '/* \lnlbl{...} */' style label in C source
  datastruct: Employ new scheme for snippets of hash_bkt.c
  datastruct: Update hashdiagram figure
  datastruct: Employ new scheme for snippets of hash_bkt_rcu and
    hash_resize
  Make sure lmtt font is used in 'VerbatimL' and 'Verbatim' env
  Use wider tabsize for snippet in 'listing*'
  datastruct: Tweak hyphenation

 CodeSamples/SMPdesign/lockhdeq.c           |  11 +-
 CodeSamples/SMPdesign/smpalloc.c           |   8 +-
 CodeSamples/count/count_end.c              |   8 +-
 CodeSamples/count/count_lim.c              |   8 +-
 CodeSamples/count/count_tstat.c            |  10 +-
 CodeSamples/datastruct/hash/hash_bkt.c     |  96 ++--
 CodeSamples/datastruct/hash/hash_bkt_rcu.c |  33 +-
 CodeSamples/datastruct/hash/hash_resize.c  | 232 +++++-----
 CodeSamples/defer/route_hazptr.c           |  20 +-
 CodeSamples/defer/route_rcu.c              |  36 +-
 CodeSamples/defer/route_refcnt.c           |  16 +-
 CodeSamples/defer/route_seq.c              |  18 +-
 CodeSamples/defer/route_seqlock.c          |  14 +-
 CodeSamples/defer/seqlock.h                |  12 +-
 CodeSamples/locking/locked_list.c          |   6 +-
 CodeSamples/toolsoftrade/forkjoinvar.c     |   2 +-
 CodeSamples/toolsoftrade/pcreate.c         |   2 +-
 datastruct/datastruct.tex                  | 687 ++++++++---------------------
 datastruct/hashdiagram.fig                 | 103 ++---
 perfbook.tex                               |   2 +
 pfhyphex.tex                               |   1 +
 utilities/fcvextract.pl                    |  87 +++-
 22 files changed, 627 insertions(+), 785 deletions(-)

-- 
2.7.4

