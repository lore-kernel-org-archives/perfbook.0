Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=we+9NDeKoN0WalvAM4UY9N4qy/QSCV2eo149UggErp4=;
 b=N6bZzM5hmrZ1Z56n/nmu6TCPeDFiJ8Go71RTxHqp8EoEeLrqsfDQfL7yACXI+S74zs
 YSxy/D4RByByZiJLyTB6bQa7MIA6FFuKVSTu3QRlzJ6cmqOvn/2m8ADxOwJntHIp8/mT
 r91eATBQk4JYiFnEmxI1TJ62kxlI+PV+L3qg97p2QPURHwcrD3oYGFwe26sn+nPeMa1n
 eghMJnwos7e3XsT4zhwAPrAGy7rE/FRdC7Jsua7wwa/HAh9bdT+gOjR1dQzw/M1w6nxo
 fN7heMz77cBvx6cKQURzVcnz2+Fy5Nm1defMnwngtkHrNbjHaqfnorpCkrihhGuYwgA9
 9ZGg==
Subject: Re: [PATCH 0/2] Bibliography updates
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
 <20170302011710.GR30506@linux.vnet.ibm.com>
 <8db9401a-88cb-e1c2-2f49-7c710547fa3e@gmail.com>
 <20170303205127.GW30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9f52e67f-e020-0d1d-7a61-c9a61d0fcdcb@gmail.com>
Date: Sat, 4 Mar 2017 16:08:32 +0900
MIME-Version: 1.0
In-Reply-To: <20170303205127.GW30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/03/04 5:51, Paul E. McKenney wrote:
> On Fri, Mar 03, 2017 at 08:48:46PM +0900, Akira Yokosawa wrote:
>> On 2017/03/01 17:17:10 -0800, Paul E. McKenney wrote:
>>> On Thu, Mar 02, 2017 at 07:10:01AM +0900, Akira Yokosawa wrote:
>>>> >From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Thu, 2 Mar 2017 06:52:36 +0900
>>>> Subject: [PATCH 0/2] Bibliography updates
>>>>
>>>> Hi Paul,
>>>>
>>>> This is another round of bibliography updates.
>>>> Patch 2 enables "pdfborder" of links in bibliography for 1c layout.
>>>> Please try it and see if it is not too distracting. If you think
>>>> it is good for 2c layout, please let me know.
>>>
>>> Applied, thanks!  The 1c borders look fine.  Given that the 2c bibliography
>>> is now single-column, we should avoid the bug, so making 2c have the
>>> borders sounds good -- especially good to flag the known broken URLs.
>>
>> Ah, I didn't intend to flag the broken URLs.
>> I'll submit a patch to enable the borders regardless of layout.
> 
> Are you sure?  Might be nice to have a visual hint as to which URLs
> work and which do not.

Sorry but I was not clear enough.

I meant that flagging broken URLs was not my original intention,
but as a bonus of the change, the absence of border indicates the URL
is broken.
And I see it actively helps readers not only in pdf viewers but also
in print.

The patch I sent yesterday enables borders for all the layout.

                                       Thanks, Akira

> 
>> ## Looks like your reply took a while to reach your mail server.
> 
> Yes, having some connectivity problems.  It seems to be necessary to
> choose the right hotspot for a given function...  :-/
> 
> Should be back to normal next week.
> 
> 							Thanx, Paul
> 
>>                                    Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>                                 Thanks, Akira
>>>>
>>>> Akira Yokosawa (2):
>>>>   Bibliography updates
>>>>   appendix: Draw hyperlink border in bibliography for 1c layout
>>>>
>>>>  appendix/appendix.tex | 14 +++++++++-----
>>>>  bib/RCU.bib           | 10 ++++++++--
>>>>  bib/TM.bib            |  5 +++--
>>>>  bib/WFS.bib           |  2 ++
>>>>  bib/os.bib            |  3 +++
>>>>  bib/parallelsys.bib   |  5 +++++
>>>>  bib/syncrefs.bib      |  1 +
>>>>  7 files changed, 31 insertions(+), 9 deletions(-)
>>>>
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>>
>>
> 
> 

