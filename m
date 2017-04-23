Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Qqb3XYv2TVaBfZ+/4GR4I0a2bYL0CnlJaVhNkzbfHVk=;
 b=M2WBV8a10ewejXpd3VhOo5DW2bztpXy+bfXzR9yw/Inc72B8yrlhHiZuI+7qwfDYv0
 nt3vm954DlduYaxuTtxZClycEUvD3a+4IWEtc48p6yrXjV8pFGwe5hvREo8qThwpt+Rr
 wScEy2E+kmZUkEUW4xgUrHgVra5lCCqMZ18KnyuHLUNWBPf+IRkh7NbtvdSvJBwTTMoM
 R++8paow/GSl5QBeriGrRGD5y8g1+4FQIZ0lS492FCJkBkDHCDtW6eUcKNDQtch2UujD
 X2bDbzWQpSjdrl4duQ+foK7Sp47kfzSCskrBiLFR4/v6/xhAfYFpo6+q9KEE06N50JOh
 D1ow==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] whymb: Prevent line breaks of memory-barrier instruction
Message-ID: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Date: Mon, 24 Apr 2017 08:51:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 343ea80f45c224bf2ecb4bcb84bdc924e8b9cb80 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 24 Apr 2017 07:23:27 +0900
Subject: [PATCH 0/4] whymb: Prevent line breaks of memory-barrier instruction

Hi Paul,

I wanted to prevent line breaks of memory-barrier instructions of
SPARC and zSeries.
However, simply using \nbco{} for them ended up in build error.
It turned out \detokenize{} command used in \nbco{} can't hold
"#" character.
Patch #1 modifies the definition of \nbco{}.
Also, those instructions are easier to recognize with quotation
marks. Instead of writing quotation marks around each instruction,
patch #1 also adds a macro named \qco{}.
Patches 2 and 3 use \qco{} for memory-barrier instructions of
SPARC and zSeries, respectively.
Patch 4 is to prevent hyphenation of "GPGPU".

Note that \tco{} macro still can't hold "#" character.

                                    Thanks, Akira
--
Akira Yokosawa (4):
  perfbook.tex: Modify definition of \nbco{}
  whymb: Prevent line breaks between 'membar' and '#Sync', etc.
  whymb: Prevent line breaks between "bcr" and "15,0"
  Add 'GPGPU' to non-hyphenation list

 Makefile                             |  1 +
 appendix/whymb/whymemorybarriers.tex | 26 +++++++++++++-------------
 perfbook.tex                         |  3 ++-
 pfhyphex.tex                         |  2 ++
 4 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.7.4

