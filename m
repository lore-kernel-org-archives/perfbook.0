Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6RhoOTwSEG6UZaaiI/8EOLfhN8wB2NlV2K6UwpTdvrs=;
 b=g+x7faWGKKyM3arM2qi2+i/p1NFEWMRKZM22+DLtuqu4/ZBWA+Ci4DdHi5sKAvAD2a
 KyQtnag+WIczxhPqZrxKKscPuak5/x2S22JKsqg3yAgVrhXhHolSxgHEDzQJ0Hd2K4zX
 g3IeMuWTZX4evEDjtA4oHJUJUXOEEbYHuK1lyf3xcnQzC5tRVvc+m9n9fBNczmIQUKfo
 ULSzAtD60DvVEQ+FBzVMU+NWoSu0ECQaZu0gtOjLmbMmAMQRgrm3v0DcslwCqxOz7GQ9
 fVCx4S0jgpSt+ERNhtHPVmeJqfRkED/9MmO2A8r6ZygQSq2nUXBa8HN/1oQZvA2h9kwI
 pR6g==
Subject: Re: [PATCH 0/5] Update table layout
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <67030f8b-7adc-602b-9d45-a619be702bf7@gmail.com>
Date: Tue, 24 Oct 2017 00:25:20 +0900
MIME-Version: 1.0
In-Reply-To: <20171023022430.GJ3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/22 19:24:30 -0700, Paul E. McKenney wrote:
> On Mon, Oct 23, 2017 at 12:20:14AM +0900, Akira Yokosawa wrote:
>> >From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 22 Oct 2017 23:55:49 +0900
>> Subject: [PATCH 0/5] Update table layout
>>
>> Hi Paul,
>>
>> My first idea was to add a make target for "table captions at the top".
>> But I changed my mind and promoted the layout as default.
>> Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
>> which keeps the caption at the bottom.
>>
>> Patch #1 does the change in perfbook.tex and Makefile.
>>
>> Patches #2 and #3 are minor fixes I noticed while updating tables.
>>
>> Patch #4 updates most tables to use the new table layout experimented in
>> Style Guide for a while.  It contains changes to use "S" column specifier
>> provided by the "siunitx" package.
>>
>> Patch #5 converts a table into a figure drawn by tabular.
>>
>> There remains several tables not yet touched. They are complex and large
>> ones. They need extra work to use the new scheme.
>>
>> NOTE: Table 13.1 does not contain legends and does not use subscripts
>> as shown in Table D.5 at the moment. In the text, it looks OK to me.
>>
>> Thoughts?
> 
> At a first scan, this all looks good.  There are a few remaining
> tables in the old format, including a couple that we discussed earlier
> as being quite complex.  Which should be fine, for the time being,
> at least.  But what are your thoughts on the remaining old-style tables?
> 

Tables 17.1 and 17.2 are hard ones. Alternate-row coloring scheme can not
be applied for them. We need to figure out how to improve them. I'm fine with
them to be left for the moment.

Table 7.1 does not fit to the format because of the "Null (Not Held)" column.
As all the cells of the column are all blank, vertical rules actually helps
in this table. If you put some character/symbol to indicate compatibility,
it can be converted to the new format. If you have a good candidate, please
let me know.

I'm sending patches to update Tables 9.3 and C.1, and a patch to convert
Tables C.2, C.3, and C.4 into Listings.

If there is any table I'm missing, feel free to tell me.

      Thanks, Akira

> Queued and pushed, thank you!
> 
> 							Thanx, Paul
> 
>>       Thanks, Akira
>> --
>> Akira Yokosawa (5):
>>   Move caption of table to top
>>   Define \twocolumnwidth for 1c layout
>>   Use \O{} macro for 'order-of'
>>   Update tables using booktabs and alternate-row coloring scheme
>>   datastruct: Convert 'NUMA Topology of System Under Test' to figure
>>
>>  Makefile                           |  6 ++-
>>  SMPdesign/SMPdesign.tex            | 10 +++--
>>  advsync/rt.tex                     |  8 ++--
>>  appendix/questions/after.tex       | 25 +++++++++----
>>  appendix/styleguide/styleguide.tex | 20 ++++++----
>>  count/count.tex                    | 54 ++++++++++++++++-----------
>>  cpu/overheads.tex                  | 76 +++++++++++++++++---------------------
>>  datastruct/datastruct.tex          | 23 ++++++++----
>>  defer/rcuapi.tex                   | 16 ++++----
>>  defer/rcufundamental.tex           | 16 ++++----
>>  defer/rcuusage.tex                 | 10 +++--
>>  defer/whichtochoose.tex            | 27 +++++---------
>>  formal/spinhint.tex                | 68 +++++++++++++++++-----------------
>>  future/QC.tex                      | 75 +++++++++++++++++++------------------
>>  memorder/memorder.tex              |  8 ++--
>>  perfbook.tex                       | 17 +++++++++
>>  together/refcnt.tex                | 25 +++++++------
>>  17 files changed, 266 insertions(+), 218 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

