Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=R0ibk0ZTn/HquRsk5Ki7gT6nDQSixWfw+CY9r89RQj8=;
        b=qGc7Yoc7OnMLHVXlUW1dOzsHTeKQR20qPD8J/qpOXahnWL9pVzUBXZXd89PDJpNHUa
         1fzH0Pz5241wpq3IV5knJHm+2PCWNHzP67eGSi2guRjck7sHIountmy/LP0HxM0YtZ76
         +UsvPXsaAqsiblcroMjhM/SpAb6/ccTWsS7gts+OEa0jeIMijjHyinx4YY1V5Q2+MqwQ
         yYPWnkMvt41d50bEFZDq+wDvcpfc0qzpr+EY0K//Mp8QMlHvD8+cnlP6kb2qa6srjHet
         5x1/iG+S6EYY3Xn8bUXJ6TSwpfyNVIkVDJscOTYbxpD29GB62BukxNLcxnjmXmD7l0VM
         T3Vg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/8] Employ cleveref macros, take four
Message-ID: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Date: Tue, 18 May 2021 21:13:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is (hopefully) the final round of \cref{} related updates.

Patches 1/8 and 2/8 are unrelated updates in build scripts.
Patch 1/8 adds patterns to catch font specifiers in .svg
figures recently added/updated.
Patch 2/8 gets rid of noindentafter.sty in our repository.
Recent distros have this package on their own.

Patches 3/8--8/8 are \cref{} related updates.

I'm thinking of adding a few patterns to cleverefcheck.pl
to catch indents by white spaces.

At least, "sh ./utilities/cleverefcheck.sh" should pass
after this patch set is applied.

Note:

    styleguide.tex is not checked by the shell script.
    I'll update it as far as I can, but it won't be
    warning-free due to its nature.

        Thanks, Akira

--
Akira Yokosawa (8):
  fixsvgfonts: Add pattern for 'sans-serif'
  Omit noindentafter.sty
  defer: Employ \cref{} and its variants, take three
  datastruct: Employ \cref{} and its variants
  debugging: Employ \cref{} and its variants
  formal: Employ \cref{} and its variants
  together, advsync, memorder: Employ \cref{} and its variants
  easy, future, appendix: Employ \cref{} and its variants

 Makefile                             |   1 -
 ack.tex                              |  40 +--
 advsync/advsync.tex                  |   2 +-
 advsync/rt.tex                       |   4 +-
 appendix/questions/after.tex         |   8 +-
 appendix/questions/removelocking.tex |   2 +-
 appendix/toyrcu/toyrcu.tex           |  10 +-
 appendix/whymb/whymemorybarriers.tex |   2 +-
 datastruct/datastruct.tex            | 348 +++++++++++++--------------
 debugging/debugging.tex              | 140 +++++------
 defer/rcuapi.tex                     |  90 +++----
 defer/rcuexercises.tex               |  12 +-
 defer/rcuintro.tex                   |   2 +-
 defer/rcurelated.tex                 |  10 +-
 defer/rcuusage.tex                   | 181 +++++++-------
 defer/updates.tex                    |   4 +-
 defer/whichtochoose.tex              |  18 +-
 easy/easy.tex                        |   6 +-
 formal/axiomatic.tex                 |  90 +++----
 formal/dyntickrcu.tex                |   2 +-
 formal/formal.tex                    |   6 +-
 formal/sat.tex                       |   2 +-
 formal/spinhint.tex                  | 122 +++++-----
 formal/stateless.tex                 |   2 +-
 future/cpu.tex                       |  10 +-
 future/formalregress.tex             |   2 +-
 future/htm.tex                       |   2 +-
 future/tm.tex                        |   2 +-
 glossary.tex                         |   2 +-
 memorder/memorder.tex                |  24 +-
 noindentafter.sty                    | 194 ---------------
 summary.tex                          |   2 +-
 together/applyrcu.tex                |   4 +-
 together/refcnt.tex                  |   4 +-
 utilities/fixsvgfonts-urwps.sh       |   2 +
 utilities/fixsvgfonts.sh             |   2 +
 36 files changed, 581 insertions(+), 773 deletions(-)
 delete mode 100644 noindentafter.sty

-- 
2.17.1

