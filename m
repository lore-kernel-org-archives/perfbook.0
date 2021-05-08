Return-Path: <SRS0=4wRT=KD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=FN7RmfeNnUCORvDaAaRXhSXY6X3iP0n8esD0f+G6n/c=;
        b=ioWpT20mV5Y0q3Ebrv2zw4pX1eMtFvIgVhUcK2v1OCFk2mf3wjpqbnHy/ep7QU2hHd
         qkDr17utzc5OABMIcIVN9uhjU5OLQi4KOgK8CDeHXErYU0beifj5xtUrKYENpVE2nipu
         M7KRsNFZfGi/qkdthLd6SHGszJDwXhM+UmJeGM+p+N5q8A5Sbu1oEc5qhYyVrPhD+HhG
         cfIsL4f+AXBH5abWM+QypqgAg5pSwZrOzCEfqopA+B9sqCqfFm5gW70LKH+sU7rTkK4u
         nJoFzZlGCCaI4YcU0YRhkDqbMQ7WjwDWgX+An5NMx71w+5zQsfIx5vUIwUKiEf1YGRw/
         RtoA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] Employ cleveref macros, take two
Message-ID: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
Date: Sat, 8 May 2021 16:05:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set is to satisfy cleverefcheck up to Chapter 7.

Note that Patch 4/4 customizes the reference name of equations so that
\cref{eq:...} expands to "Eq.~m.n" and \Cref{eq:...} expands to
"Equation~m.n".

You can see the expansions to "Eq.~m.n" in the Answers to Quick
Quizzes 5.17 and 6.20.

Thanks, Akira

--
Akira Yokosawa (4):
  count: Employ \cref{} and its variants
  SMPdesign: Employ \cref{} and its variants
  locking: Employ \cref{} and its variants
  perfbook-lt: Customize reference style of equation

 SMPdesign/SMPdesign.tex       | 138 ++++----
 SMPdesign/beyond.tex          | 121 ++++---
 SMPdesign/criteria.tex        |  10 +-
 SMPdesign/partexercises.tex   | 134 ++++----
 count/count.tex               | 586 +++++++++++++++++-----------------
 locking/locking-existence.tex |  22 +-
 locking/locking.tex           | 268 ++++++++--------
 perfbook-lt.tex               |   2 +
 8 files changed, 639 insertions(+), 642 deletions(-)

-- 
2.17.1

