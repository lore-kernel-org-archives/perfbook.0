Return-Path: <SRS0=jSvE=KB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=RMYCoewfMd5vofwMlkC5w549ZQaZpuff/XTDa8AB76Y=;
        b=JWxix4MP4QRMnwEyq4umwQ5FY/rMlX9RO568qMNfe7gmNj8P1kLzK2aYgrs5RlAWv6
         keJ9XNAAba5n9RtqS330GjvePuciw4S0P8TBe9IlDkf6+kLio7Xx012p8LW2mswKR3IW
         rrQTSWhOspMUI8vXCvCUcJRJfjlkouxzUn1WtnxtJ8Iz9i9jWhT92Bj8vBeUUIZkDoA9
         JDDrugoKkMPv6qdNG4+cavtzn2PcxIRx6VfkntoHI7CYYBsVd62MRSn59eJrRyFXIaW0
         FKC87a1MGiFr9fhVyjcq6z5A/3+pBW2GKpjRzaPFnwZvKMJkCZTQbfWJF85K5PqWXTTp
         Hjrw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] Add script to check cleveref macro uses
Message-ID: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
Date: Thu, 6 May 2021 23:21:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Now that end-of-sentence periods are at the end of input lines,
wrong uses of \Cref{}, \cref{}, and their variants can be detected
by a not-that-intelligent script.

Patch 1/4 adds the set of scripts.
They also detect raw \ref{} and \lnref{} commands.

Patches 2/4--4/4 are updates of intro, cpu, and toolsoftrade
to satisfy the scripts.

Remaining updates of the other chapters will follow when they
are ready.

My plan is to add the check as a make target once the other updates
are finished.

In the meantime, you can run the check of each file by:

    ./utilities/cleverefcheck.pl count/count.tex

, or tree-wide:

    ./utilities/cleverefcheck.sh

        Thanks, Akira

--
Akira Yokosawa (4):
  cleverefcheck: Add check script of cleveref macro usage
  intro: Employ \cref{} and its variants
  cpu: Employ \cref{} and its variants
  toolsoftrade: Employ \cref{} and its variants

 cpu/cpu.tex                   |   6 +-
 cpu/hwfreelunch.tex           |  12 +-
 cpu/overheads.tex             |  26 +--
 cpu/overview.tex              |  32 +--
 cpu/swdesign.tex              |  18 +-
 intro/intro.tex               |  24 +-
 perfbook-lt.tex               |  21 ++
 toolsoftrade/toolsoftrade.tex | 412 +++++++++++++++++-----------------
 utilities/cleverefcheck.pl    |  96 ++++++++
 utilities/cleverefcheck.sh    |  23 ++
 10 files changed, 402 insertions(+), 268 deletions(-)
 create mode 100755 utilities/cleverefcheck.pl
 create mode 100755 utilities/cleverefcheck.sh

-- 
2.17.1

