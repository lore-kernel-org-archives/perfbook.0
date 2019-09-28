Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bqvfrQraUfBMZQAhAZLllCtUspYhTafCAast3M2DH5k=;
        b=qpkE8R7oC/CtMqhJwreL9H5VsOfBzYFTbnaaedh9JQSlY3EigHN0XM+s23te4YrC4D
         VShnjgfMPeztWnbHjxXJcTR09RNZJddK6fleAbmuNYuYMfubdOnH/tkpjjPmuC2dm/yi
         iRVY8JGw1pmSWDhvQ27s265yrEn3sDFtND8qtIfZkIJIybYGkCc6mGEMVg/4dYh+Nlom
         NfVYZ/G5vRk7XQRvYkc8fEz1LsuwAPfds3Gb1wv73HYJiR4M/YsymFY4Q9yef42P6tfu
         dTJML0OnPdq4OcC6A2T6puv10lInVJXvu54m5hTT1C14SXJcfb3iPYP6NYI1OCb8H2jw
         Xlkw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] ppcmem: Apply new scheme of code snippets
Message-ID: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Date: Sat, 28 Sep 2019 10:56:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH 0/6] ppcmem: Apply new scheme of code snippets

Hi Paul,

This patch series mostly consists of code snippet updates in
formal/ppcmem.tex.

Patch #1 fixes a trivial typo in dyntickrcu.
Patch #2 is the main changes in this series. It also employs
"cleveref" way of cross references.

Patches #3--#6 touches the text and add a couples of references
to PowerPC atomic updates in the Linux kernel.

Patch #3 adds entries in bib/swtools
Patch #4 adds citation of Git commit in 2013
Patches #5 and #6 add a Quick Quiz on another missing full memory
barrier in the beginning. I'm not that sure the added Quick Quiz
makes sense, though. If it doesn't, please skip #5 and #6.

I remember asking you about the difference of the code emitted by
an atomic built-in of PowerPC-GCC and the code in Linux kernel [1].
IIUC, the added references and Quick Quiz are related to the
question.

[1]: https://www.spinics.net/lists/perfbook/msg02077.html

Seeing the history of the changes and your answer to [1], I suspect
that now that PPC_ATOMIC_ENTRY_BARRIER is "sync", "isync" might be
sufficient for PPC_ATOMIC_EXIT_BARRIER. Obviously I'm not an expert
of PowerPC and can be missing something, but I couldn't help
mentioning.

        Thanks, Akira
--
Akira Yokosawa (6):
  dyntickrcu: Fix trivial typo
  ppcmem: Apply new scheme of code snippets
  bib/swtools: Add refereneces to PowerPC atomic RMW fixes
  ppcmem: Cite Git commit of PowerPC atomic_xxx_return fix
  ppcmem: Add Quick Quiz on lwsync in Listing 12.23
  ppcmem: Move final sentence of Answer to QQZ 12.27 to the next

 bib/swtools.bib       |  33 +++++++
 formal/dyntickrcu.tex |   2 +-
 formal/ppcmem.tex     | 210 +++++++++++++++++++++++-------------------
 3 files changed, 149 insertions(+), 96 deletions(-)

-- 
2.17.1

