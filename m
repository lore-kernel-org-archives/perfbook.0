Return-Path: <SRS0=utkl=IG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=RDg7b1vwChXFC91tm7JWT1KdCbCaOBHZtAgPp2/TdRA=;
        b=SC1M8Vgo37RVcUrvUotSQ84qCyue6VZxCs7HRroCfLsaDoq6759Stt/8VpT6Tg2OR+
         rthI62Qio+jlx5OzzyGjii+D2XkbQp+r4fkgZsr4mOVFbVzQwgge5s9VZtV9K1RyFdnP
         EdyVPdiIhRdgPUqzas+qwafzlLVo5C45L8VwGehPI+PcosDHLsvI+2luYkJtFI5V4dbc
         1MO9NJW4o1vAr4if68lGRdM6OBqvzE4zFexk+FsaxkqF5PceKHPqN145/MaN5TErr0RY
         6Awqyvr/BO3RwU/Ut3xmftcjF3rCFKtdxh538eqpVLj+wcjN+2yzdMMpRQkyXn3mMRoV
         lULw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4 -perfbook] Cite recent editions of textbooks; Fix indexing
 macro
Message-ID: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
Date: Mon, 8 Mar 2021 10:52:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set adds citations to a couple of recent textbooks in
howto's "Alternatives to This Book".
It also includes fixes of \ppl*{} macro usages.

Patch 1/4 adds some of recent editions of "classic" textbooks
mentioned in "Alternatives to This Book". It also adds/fixes a few
doi info elsewhere.

Patch 2/4 updates howto.tex to add citations to those textbooks.

I have not checked if those recent editions keep the contents referred
to in this section, though.  Especially, "C++ Concurrency in Action,
2nd Edition" has omitted the sub title of "Practical Multithreading".

So there might be a room to adjust context in the list. 

Patch 2/4 also fixes a few issues of \ppl{}{} macro usages.
Index markings of "Hennessy" and "Patterson" you added in commit
dbafd71e3c2e ("howto: Updates and wordsmithing") don't match
existing markings in cpu.tex, which resulted in duplicates in
the the Index page.
Also, as they are pretty famous professors, I used \pplsur{}{} to
display only their family names.

Patches 3/4 and 4/4 are minor updates to use fully spelled first
names in index where possible.  

Akira Yokosawa (4):
  bib: Add recent editions of textbooks
  howto: Cite recent editions of textbooks
  defer/rcurelated: Spell first names of Lehman and Weizenbaum for index
  bib/RCU: Spell first name of Lehman in Kung80

 bib/RCU.bib          |  2 +-
 bib/hw.bib           | 10 ++++++++++
 bib/os.bib           |  7 +++++++
 bib/parallelsys.bib  |  8 +++++---
 bib/syncrefs.bib     | 28 ++++++++++++++++++++++++++++
 cpu/cpu.tex          |  2 +-
 defer/rcurelated.tex |  4 ++--
 howto/howto.tex      | 19 ++++++++++---------
 8 files changed, 64 insertions(+), 16 deletions(-)

-- 
2.17.1

