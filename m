Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=NhTmbWZcSlDHptJAJhvdT8JS/RwU3v/aAmOadVcRrr4=;
 b=OrW9nDbCFYnxFhMNTecJShNuue99CtCsR2NWVYKBs2q10GCMzM89wV4Iw75AORg+KL
 5ihFsweB6zFv9kNBiijG68BymfTq3gW1q2L6hTu7VV5ud/NQjJb0XWZdLoRpw+NdslOf
 UgSX66pymzV8ja2kFXbj84r+EYt/bPYX4esoD1hcIQQqqu4lfI6NfogiE2qqDlOX3ZjH
 Ai3xUNJmIQgoUMQRx4j7QJJWPhzfR1kA/gmcV3ZJ+QDWWvcujfLdopWRCYYbdrVGDzaW
 CESlRkuufy/wOiMTloU12FYdFZIbK1y9qv196q+ZcGPMcUcwNOxZQVt9r1y6aQY91JMq
 d4kQ==
Subject: Re: [PATCH 0/2] Bibliography updates
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
 <20170302011710.GR30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8db9401a-88cb-e1c2-2f49-7c710547fa3e@gmail.com>
Date: Fri, 3 Mar 2017 20:48:46 +0900
MIME-Version: 1.0
In-Reply-To: <20170302011710.GR30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/03/01 17:17:10 -0800, Paul E. McKenney wrote:
> On Thu, Mar 02, 2017 at 07:10:01AM +0900, Akira Yokosawa wrote:
>> >From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 2 Mar 2017 06:52:36 +0900
>> Subject: [PATCH 0/2] Bibliography updates
>>
>> Hi Paul,
>>
>> This is another round of bibliography updates.
>> Patch 2 enables "pdfborder" of links in bibliography for 1c layout.
>> Please try it and see if it is not too distracting. If you think
>> it is good for 2c layout, please let me know.
> 
> Applied, thanks!  The 1c borders look fine.  Given that the 2c bibliography
> is now single-column, we should avoid the bug, so making 2c have the
> borders sounds good -- especially good to flag the known broken URLs.

Ah, I didn't intend to flag the broken URLs.
I'll submit a patch to enable the borders regardless of layout.

## Looks like your reply took a while to reach your mail server.

                                   Thanks, Akira

> 
> 							Thanx, Paul
> 
>>                                 Thanks, Akira
>>
>> Akira Yokosawa (2):
>>   Bibliography updates
>>   appendix: Draw hyperlink border in bibliography for 1c layout
>>
>>  appendix/appendix.tex | 14 +++++++++-----
>>  bib/RCU.bib           | 10 ++++++++--
>>  bib/TM.bib            |  5 +++--
>>  bib/WFS.bib           |  2 ++
>>  bib/os.bib            |  3 +++
>>  bib/parallelsys.bib   |  5 +++++
>>  bib/syncrefs.bib      |  1 +
>>  7 files changed, 31 insertions(+), 9 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

