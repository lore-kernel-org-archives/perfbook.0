Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E77iisgAYbk25By1Sh4+ba34vl4E7uMQinrStHfnwNk=;
 b=q8lItqmshEtB3QYd8VANWF/VV+898Un+04qTQVnHVdRzi73b2OrxRRF7yik9uPKSSd
 ErO+8NSgIw1/5gj1ZOfM5gTbwUlfTuXAsPPGTGM16Dv0mCreugQ4KJV+vQEJoopEt4/W
 DO2XByl9sTr0apDc2mVHrKk7CyzJhMlunM1woviEsPRhgLvuLM52/gmdUh2IojyF+yyb
 8eeGxxBNuwUk9G+Q0R88u1MZrah8rSUhV/Uv7+f2j/QnJKfeKcFJ7m2p3Sz0HsfgzWnL
 vNTm00UQJPy1N9EgTSAyX1Qhn1ToqoMBD6gXZApKuOV1u++IoqAr6arJhBo+8F2I99MV
 myOA==
Subject: Re: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
 <71c01432-ecaa-d43b-269e-b44bd7cdf1ce@gmail.com>
 <20170130195855.GP3989@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <26665e7d-09bd-9fcc-e4e8-98b74a80a0c0@gmail.com>
Date: Tue, 31 Jan 2017 07:21:15 +0900
MIME-Version: 1.0
In-Reply-To: <20170130195855.GP3989@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/01/30 11:58:55 -0800, Paul E. McKenney wrote:
> On Mon, Jan 30, 2017 at 12:30:48AM +0900, Akira Yokosawa wrote:
>> >From ab76f3f9691060ea7b88561e6027a9ee65857f45 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 13 Nov 2016 13:23:45 +0900
>> Subject: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a
>>
>> Also fix publication info to match what is found in ACM Digital
>> Library.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  bib/syncrefs.bib | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
>> index aa2baad..073ada8 100644
>> --- a/bib/syncrefs.bib
>> +++ b/bib/syncrefs.bib
>> @@ -311,11 +311,12 @@ Symposium on Computer Architecture"
>>  ,author="Leonidas Kontothanassis and Robert W. Wisniewski and Michael L. Scott"
>>  ,title="Scheduler-Conscious Synchronization"
>>  ,Year="1997"
>> -,Month="January"
>> -,journal="Communications of the {ACM}"
>> +,Month="Feburuary"
> 
> I fixed this to "February" while applying to my private bibtex archive.  ;-)

Oops, thanks for the fix!

Akira

> 
> 							Thanx, Paul
> 
>> +,journal="{ACM} Transactions on Computer Systems"
>>  ,volume="15"
>>  ,number="1"
>>  ,pages="3--40"
>> +,doi="10.1145/244764.244765"
>>  }
>>
>>  @Conference{HubertusFrancke2002Futex
>> -- 
>> 2.7.4
>>
>>
> 
> 

