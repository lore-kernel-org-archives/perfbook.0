Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C61DC05F
	for <perfbook@vger.kernel.org>; Tue, 18 Mar 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742321806; cv=none; b=C8IxTBoMAhTQI9H8XSLJQhM0UqAKQ7LwgHu17ee9MJj4n0EO9j1r+6TnS89FD+o1Us2hVX/15E1iAFtN1Q+5QttForQkbSRwqYMxOCWKgPAqhMiF2Ee3I3P3pMMSAriqhotjYfluxvJWsv8JNFjiiZi+y1jLCYXuZ3nxqUFXbwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742321806; c=relaxed/simple;
	bh=U7wvnywH2mCgS7okHXborflyEOd/gWDxkUtZcS7use0=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ggTukjv5H/1OcNzPhirO4WqQdpr/WTZgec9N6BlC5dhEILhcYtY0ST1Zn538BTOhvYf04L24942rdAuqL9RucOLBQITWNsh1Hi9rPE1vZNF0eU0CcrYnAycIAPRcggQ+ttSRDPnJlLQOqJ2fYP2VPeftF80HUemAW3SryoWiqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=TpheAliT; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="TpheAliT"
Content-Type: multipart/mixed; boundary="------------0UPL7PMVVTC5OH9BJjovEe00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742321801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Nw8+IzRh9wC+KfZC9ZHGpPunDGMKh/Og5E0Q5brqd3k=;
	b=TpheAliTml3wxFe6Ywoky+HhwTRSPIgY0Pr63qFfgysfgCdlwpgjBO28o5CHTokB/o3S0X
	LRVM2MpHSZ/qXamslfpxxX2gr68MLEgPk22umN/R/KysYk0VJRVBuzY9I19MqyHY37pJja
	kP2+AfTl1qv5u1yg3Qu0ZUXg0gLZCEwtnqO7y7qcZiEusjkrELJl5/xQXOEj/DUrvc4A/Z
	6RNdZJc4htc7b0AFzbW4roODXHjYKbd39AXc2AE2CyeJ2BaCrn3TV2b1YzuXQGqTXJ/7OV
	v3uynvoESTsy91LAoqA1T8KUcouWzYyKrTpV+rMhIgkdADTEwymwAYXr9sGRww==
Message-ID: <68b0a4f7-07eb-4e69-96fc-2cc4b40ad818@iencinas.com>
Date: Tue, 18 Mar 2025 19:16:38 +0100
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Is Alpha non-other-multicopy atomic?
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
References: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
 <64509d29-0593-4b7b-bb29-8a96835ac1bc@gmail.com>
 <03f234c4-faac-49ef-8956-2bf04579eab7@iencinas.com>
 <c1832cf9-49e6-461f-bf6c-92b6b5e7f220@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Autocrypt: addr=ignacio@iencinas.com; keydata=
 xjMEZgaZEBYJKwYBBAHaRw8BAQdAYZxeXU5yoeLYkQpvN+eE3wmAF4V0JUzIlpm/DqiSeBnN
 LElnbmFjaW8gRW5jaW5hcyBSdWJpbyA8aWduYWNpb0BpZW5jaW5hcy5jb20+wo8EExYIADcW
 IQSXV5vKYfM26lUMmYnH3J3Ka8TsNgUCZgaZEAUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEA
 AAoJEMfcncprxOw21F4BAJe+mYh3sIdSvydyDdDXLFqtVkzrFB8PVNSU9eZpvM0mAP9996LA
 N0gyY7Obnc3y59r9jOElOn/5fz5mOEU3nE5lCc44BGYGmRESCisGAQQBl1UBBQEBB0CVC5o6
 qnsTzmmtKY1UWa/GJE53dV/3UPJpZu42p/F0OAMBCAfCfgQYFggAJhYhBJdXm8ph8zbqVQyZ
 icfcncprxOw2BQJmBpkRBQkFo5qAAhsMAAoJEMfcncprxOw2N8ABAPcrkHouJPn2N8HcsL4S
 SVgqxNLVOpsMX9kAYgIMqM0WAQCA40v0iYH1q7QHa2IfgkrBzX2ZLdXdwoxfUr8EY5vtAg==
In-Reply-To: <c1832cf9-49e6-461f-bf6c-92b6b5e7f220@gmail.com>
X-Migadu-Flow: FLOW_OUT

This is a multi-part message in MIME format.
--------------0UPL7PMVVTC5OH9BJjovEe00
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not trimming email content in case it makes reading the reply less
confusing. I hope I'm not being too annoying and wasting too much of
your time on this.

On 17/3/25 10:58, Akira Yokosawa wrote:
> Ignacio Encinas Rubio wrote:
>> On 16/3/25 12:37, Akira Yokosawa wrote:
>>> As is well known, Alpha is infamous of its lack of address-dependency
>>> guarantees.  I don't see much point in discussing whether it is multicopy
>>> atomic or not.
>>
>> I agree this is not particularly important, I just found contradicting
>> information and wanted to clarify/fix Table 15.5.
>>
>>> If you have access to an Alpha machine with 3 or more CPUs,
>>> you should be able to run this test with the help of klitmus7.
>>
>> Thanks for the test. Sadly, I don't have access to an Alpha CPU (I was
>> born after DEC was bought by Compaq)
> 
> That is what I had anticipated ...
> 
>>
>>> Finally, my mental model of other-multi-copy might be different from
>>> those defined in papers you cited below. 
>>
>> Might be, I have just realized mine is wrong. I have just run Listing 
>> 15.16 (C-WRC...) in herd using the "linux" model to realize the exists
>> clause can trigger. 
>>
>> Note that it can do so while "RFE" imposes order for the "linux" model 
>> (it is part of happens-before), so my original comment stating 
>>
>>   non-mca == rfe does not impose order 
>>
>> is wrong if Read[X = 0] (fr) -> Write[X = 1] does not mean that the read
>> is ordered before the write. However, this doesn't seem to be the case
>> for Alpha [3]
>>
>>   Section 5.6.1.2: The ordering relation Before (<=) is acyclic
>>   Section 5.6.1.4: If u and v are overlapping read/write accesses, at
>>     least one of which is a write, then u and v must be comparable in 
>>     the BEFORE (<=) ordering, that is, either u <= v or v <= u.
>>
> 
> The wording "If u and v are overlapping read/write accesses" sounds to
> me like it has nothing to do with what perfbook calls "multicopy atomicity".
> It is more related to the concept of perfbook's "single-copy atomicity" or
> "coherency", isn't it?
> 
> Quite from Section 15.3.6:
> 
>   On cache-coherent platforms, all CPUs agree on the order of loads and
>   stores to a given variable. Fortunately, when READ_ONCE() and WRITE_ONCE()
>   are used, almost all platforms are cache-coherent, as indicated by the "SV"
>   column of the cheat sheet shown in Table 15.3. Unfortunately, this property
>   is so popular that it has been named multiple times, with "single-variable
>   SC", "single-copy atomic" [SF95], and just plain "coherence" [AMP+11]
>   having seen use.
> 
> Miss-orderings related to address-dependent loads on Alpha happen only
> when two variables belong to two different cache banks as shown in
> Figure 15.25.
> They don't happen when u and v overlap (and share a cache line).
> 
> I'm suspecting that the meaning of "multicopy atomicity" in perfbook
> (or LKMM), and/or my interpretation of it, might not be exactly the
> same as what is widely accepted by computer industry people.
> 
> Are we on the same page now?

Yes, I was only (incorrectly) trying to elaborate on my assumption of
what makes a memory model non-multicopy atomic. I was under the false
impression that it could only come from relaxing "Read From External
(rfe)", similar to how "Read from Internal (rfi)" (or Store forwarding,
however you want to call this). In hardware terms, this could be sharing
the Store Buffer in a multithreaded CPU (presumably what PowerPC
implementations do).

I simply stared at the "WRC" litmus test diagram generated by herd [1]
for the case where the "exist" clause triggers and became more and more
confused at how "a: W[once][x]" is not "happened before (hb)" "e:
R[once][x]" (see attached svg file). Somehow I reached the conclusion 
that the way this must be allowed by the LKMM is by having "e" and "a" 
be non-comparable, that's why I invoked Section 5.6.1.4 from Alpha's 
manual. However, the comparison is flawed, most notably because for
Alpha a write (W) that consumes a read's (R) result isn't ordered with
respect to (R).

[1] https://diy.inria.fr/www/#

>> It's still my opinion that Alpha is other-multi-copy atomic but I
>> understand it is a bit pointless to discuss about this... Sorry, I
>> couldn't resist.

As to my opinion, I'll try to elaborate in "hardware" terms:

[2] states the following: 

| Broadly, non-MCA permits two hardware optimisations: (1) a shared, 
| pre-cache store-buffer that allows early forwarding of data between a 
| subset of the 
| invalidations to other caches participating in a cache-coherence 
| protocol without waiting for their acknowledgement. Whilst these 
| optimisations may be worthwhile (or even necessary) in some contexts, 
| for ARM there was a clear internal conclusion that these optimisations 
| offer little benefit in ARM’s context, partly because the ARM bus 
| architecture (AMBA) has always been MCA

Alpha (as far as I know) didn't have (1) and its reference manual
clearly forbids it (at least in a naive manner where consistency isn't
taken care of through speculation recovery mechanisms). 

If we look at (2), it seems that Alpha did indeed perform writes after
just having received the invalidation acknowledgement (but without
having the other cores actually invalidate the cache line). This is
depicted in the perfbook's Section C.4.2 and some of its references such
as [Gha95, Section 5.4.1]. If we consider the definition of "Multi-copy
atomicity" or ARM's "Other-multi-copy atomicity", it means that a write
becomes visible to every _other_ agent at the same time. 

Then, the question here basically becomes if that having received an 
early invalidation acknowledgement from "Processor i (Pi)" means that 
the write is visible to Pi. This should settle whether Alpha is
non-multicopy atomic or not.


[Gha95, Page 181] says the following

| Maintaining Multiple-Copy Atomicity: As we discussed earlier in this 
| section, enforcing the third category of multiprocessor dependence 
| chains requires providing the illusion of multiple-copy atomicity in 
| addition to maintaining the program order among operations. This 
| section describes the implementation of the two techniques for 
| enforcing multiple-copy atomicity (that were introduced earlier) in 
| more detail

[...] 

| The functionality is not needed at all for the PC, RCpc, and PowerPC 
| models since these models do not enforce any category three 
| multiprocessor dependence chains. For the SC, TSO, IBM-370, PSO, WO, 
| RCsc, Alpha, and RMO models, all writes must be treated conservatively

Note that Alpha is described as enforcing "category three multiprocessor
dependence chains", which from the context we can infer it means being
multi-copy atomic(?). Later on [Gha95, Section 5.4.1] says the following 
when discussing early acknowledgement:

| However, naive applications of this optimization can lead to incorrect 
| implementations since an acknowledgement reply no longer signifies the 
| completion of the write with respect to the target processor. 
| This section describes two distinct implementation techniques that 
| enable the safe use of early acknowledgements

[...]

| The second solution does not impose any ordering constraints
| among incoming messages. Instead, it requires previously committed 
| invalidation and update requests to be serviced anytime program order 
| is enforced for satisfying a multiprocessor dependence chain. In the 
| example, this latter solution would force the invalidation request to 
| be serviced (e.g., by flushing the incoming queue) as part of 
| enforcing the program order from the read of B to the read of A


In other words, I would say that if we put together

1.- "There are no implied barriers in Alpha. If an implied barrier is
     needed for functionally correct access of shared data, it must be
     written as an explicit instruction"

and 

2.- Read memory barriers drain the pending invalidations' queue

it *effectively* means that if a read "R1" has directly or indirectly
observed a write "W", there is a memory barrier (only way to enforce
oredering) and then another read "R2" is performed, it must also see
"W".

Using "WRC" (Listing 15.16) and its associated Table 15.4 as an example, 
it would mean that "r3 = READ_ONCE(*x)" CAN'T read a 0 in Alpha because
the read memory barrier drains the pending invalidation queue.
Therefore, r3 would miss in cache and be served with P0's write.

Thank you *very much* for the discussion :)

[2] https://www.cl.cam.ac.uk/~pes20/armv8-mca/armv8-mca-draft.pdf
[Gha95] perfbook's link is down, it is also available here: 
https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf

> 
> No need to apologize.
> Any feedback from a fresh minded reader is much appreciated!
> 
>         Thanks, Akira
> 
>>
>> Thanks
>>
>> [3] https://download.majix.org/dec/alpha_arch_ref.pdf
>>
>>
> 
--------------0UPL7PMVVTC5OH9BJjovEe00
Content-Type: image/svg+xml; name="wrc-exists.svg"
Content-Disposition: attachment; filename="wrc-exists.svg"
Content-Transfer-Encoding: base64

77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5v
Ij8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIKICJo
dHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8IS0t
IEdlbmVyYXRlZCBieSBncmFwaHZpeiB2ZXJzaW9uIDIuMjguMCAoMjAxNDAxMTEuMjMxNSkK
IC0tPgo8IS0tIFRpdGxlOiBHIFBhZ2VzOiAxIC0tPgo8c3ZnIHdpZHRoPSI2MDVwdCIgaGVp
Z2h0PSIzNTVwdCIKIHZpZXdCb3g9IjAuMDAgMC4wMCA2MDUuMDAgMzU1LjQyIiB4bWxucz0i
aHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3Lncz
Lm9yZy8xOTk5L3hsaW5rIj4KPGcgaWQ9ImdyYXBoMCIgY2xhc3M9ImdyYXBoIiB0cmFuc2Zv
cm09InNjYWxlKDIuMDgzMzMgMi4wODMzMykgcm90YXRlKDApIHRyYW5zbGF0ZSg3LjIgMTYz
LjQpIj4KPHRpdGxlPkc8L3RpdGxlPgo8cG9seWdvbiBmaWxsPSJ3aGl0ZSIgc3Ryb2tlPSJu
b25lIiBwb2ludHM9Ii03LjIsNy4yIC03LjIsLTE2My40IDI4My4yLC0xNjMuNCAyODMuMiw3
LjIgLTcuMiw3LjIiLz4KPCEtLSBwcm9jMF9sYWJlbF9ub2RlIC0tPgo8ZyBpZD0ibm9kZTEi
IGNsYXNzPSJub2RlIj48dGl0bGU+cHJvYzBfbGFiZWxfbm9kZTwvdGl0bGU+Cjx0ZXh0IHRl
eHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ4IiB5PSItMTQ2LjgiIGZvbnQtZmFtaWx5PSJUaW1l
cyxzZXJpZiIgZm9udC1zaXplPSI4LjAwIj5UaHJlYWQgMDwvdGV4dD4KPC9nPgo8IS0tIGVp
aWQwIC0tPgo8ZyBpZD0ibm9kZTIiIGNsYXNzPSJub2RlIj48dGl0bGU+ZWlpZDA8L3RpdGxl
Pgo8dGV4dCB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB4PSI0OCIgeT0iLTExNC40IiBmb250LWZh
bWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+YTogV1tvbmNlXVt4XT0xPC90
ZXh0Pgo8L2c+CjwhLS0gZWlpZDEgLS0+CjxnIGlkPSJub2RlNCIgY2xhc3M9Im5vZGUiPjx0
aXRsZT5laWlkMTwvdGl0bGU+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjEzOCIg
eT0iLTExNC40IiBmb250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+
YjogUltvbmNlXVt4XT0xPC90ZXh0Pgo8L2c+CjwhLS0gZWlpZDAmIzQ1OyZndDtlaWlkMSAt
LT4KPGcgaWQ9ImVkZ2UzIiBjbGFzcz0iZWRnZSI+PHRpdGxlPmVpaWQwJiM0NTsmZ3Q7ZWlp
ZDE8L3RpdGxlPgo8cGF0aCBmaWxsPSJub25lIiBzdHJva2U9InJlZCIgZD0iTTk2LjE2MTcs
LTEyMy41MzVDOTYuMjAzNSwtMTIzLjUzNSA5Ni4yNDUzLC0xMjMuNTM0IDk2LjI4NzEsLTEy
My41MzQiLz4KPHBvbHlnb24gZmlsbD0icmVkIiBzdHJva2U9InJlZCIgcG9pbnRzPSI4OC40
NDI5LC0xMjYuNDE5IDk2LjQxMjUsLTEyMy41MzMgODguMzgyOCwtMTIwLjgxOSA4OC40NDI5
LC0xMjYuNDE5Ii8+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9Ijk4Ljg4NzYiIHk9
Ii0xMjUuOTM1IiBmb250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCIg
ZmlsbD0icmVkIj5yZjwvdGV4dD4KPC9nPgo8IS0tIGVpaWQwJiM0NTsmZ3Q7ZWlpZDEgLS0+
CjxnIGlkPSJlZGdlNSIgY2xhc3M9ImVkZ2UiPjx0aXRsZT5laWlkMCYjNDU7Jmd0O2VpaWQx
PC90aXRsZT4KPHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSJpbmRpZ28iIGQ9Ik05Ni4xNjE3
LC0xMTAuMDY1Qzk2LjIwMzUsLTExMC4wNjUgOTYuMjQ1MywtMTEwLjA2NiA5Ni4yODcxLC0x
MTAuMDY2Ii8+Cjxwb2x5Z29uIGZpbGw9ImluZGlnbyIgc3Ryb2tlPSJpbmRpZ28iIHBvaW50
cz0iODguMzgyOCwtMTEyLjc4MSA5Ni40MTI1LC0xMTAuMDY3IDg4LjQ0MjksLTEwNy4xODEg
ODguMzgyOCwtMTEyLjc4MSIvPgo8dGV4dCB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB4PSIxMDAu
MjI0IiB5PSItMTAyLjg2NSIgZm9udC1mYW1pbHk9IlRpbWVzLHNlcmlmIiBmb250LXNpemU9
IjguMDAiIGZpbGw9ImluZGlnbyI+aGI8L3RleHQ+CjwvZz4KPCEtLSBwcm9jMV9sYWJlbF9u
b2RlIC0tPgo8ZyBpZD0ibm9kZTMiIGNsYXNzPSJub2RlIj48dGl0bGU+cHJvYzFfbGFiZWxf
bm9kZTwvdGl0bGU+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjEzOCIgeT0iLTE0
Ni44IiBmb250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+VGhyZWFk
IDE8L3RleHQ+CjwvZz4KPCEtLSBlaWlkMiAtLT4KPGcgaWQ9Im5vZGU1IiBjbGFzcz0ibm9k
ZSI+PHRpdGxlPmVpaWQyPC90aXRsZT4KPHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0i
MTM4IiB5PSItNjAuNCIgZm9udC1mYW1pbHk9IlRpbWVzLHNlcmlmIiBmb250LXNpemU9Ijgu
MDAiPmM6IFdbb25jZV1beV09MTwvdGV4dD4KPC9nPgo8IS0tIGVpaWQxJiM0NTsmZ3Q7ZWlp
ZDIgLS0+CjxnIGlkPSJlZGdlNiIgY2xhc3M9ImVkZ2UiPjx0aXRsZT5laWlkMSYjNDU7Jmd0
O2VpaWQyPC90aXRsZT4KPHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSJpbmRpZ28iIGQ9Ik0x
MzgsLTEwNy44ODNDMTM4LC0xMDAuMjU1IDEzOCwtODkuMDY0NSAxMzgsLTc5Ljc0MDgiLz4K
PHBvbHlnb24gZmlsbD0iaW5kaWdvIiBzdHJva2U9ImluZGlnbyIgcG9pbnRzPSIxNDAuOCwt
NzkuNTUxIDEzOCwtNzEuNTUxMSAxMzUuMiwtNzkuNTUxMSAxNDAuOCwtNzkuNTUxIi8+Cjx0
ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjEzNCIgeT0iLTkyLjE5NzIiIGZvbnQtZmFt
aWx5PSJUaW1lcyxzZXJpZiIgZm9udC1zaXplPSI4LjAwIiBmaWxsPSJpbmRpZ28iPmhiPC90
ZXh0Pgo8L2c+CjwhLS0gZWlpZDMgLS0+CjxnIGlkPSJub2RlNyIgY2xhc3M9Im5vZGUiPjx0
aXRsZT5laWlkMzwvdGl0bGU+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjIyOCIg
eT0iLTExNC40IiBmb250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+
ZDogUltvbmNlXVt5XT0xPC90ZXh0Pgo8L2c+CjwhLS0gZWlpZDImIzQ1OyZndDtlaWlkMyAt
LT4KPGcgaWQ9ImVkZ2U0IiBjbGFzcz0iZWRnZSI+PHRpdGxlPmVpaWQyJiM0NTsmZ3Q7ZWlp
ZDM8L3RpdGxlPgo8cGF0aCBmaWxsPSJub25lIiBzdHJva2U9InJlZCIgZD0iTTE0NC40OCwt
NzEuNTYxQzE1NS4wMDYsLTgwLjYwNDUgMTc2LjIwMSwtOTQuMTg4MyAxOTQuNjI5LC0xMDQu
MjUxIi8+Cjxwb2x5Z29uIGZpbGw9InJlZCIgc3Ryb2tlPSJyZWQiIHBvaW50cz0iMTkzLjQx
LC0xMDYuNzc0IDIwMS43ODksLTEwOC4wNTMgMTk2LjAzNywtMTAxLjgyOCAxOTMuNDEsLTEw
Ni43NzQiLz4KPHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMTY5LjQ3MSIgeT0iLTkz
LjQ1NTkiIGZvbnQtZmFtaWx5PSJUaW1lcyxzZXJpZiIgZm9udC1zaXplPSI4LjAwIiBmaWxs
PSJyZWQiPnJmPC90ZXh0Pgo8L2c+CjwhLS0gZWlpZDImIzQ1OyZndDtlaWlkMyAtLT4KPGcg
aWQ9ImVkZ2U3IiBjbGFzcz0iZWRnZSI+PHRpdGxlPmVpaWQyJiM0NTsmZ3Q7ZWlpZDM8L3Rp
dGxlPgo8cGF0aCBmaWxsPSJub25lIiBzdHJva2U9ImluZGlnbyIgZD0iTTE2NC4yNTgsLTcx
LjU3MTVDMTgwLjg3NywtODAuMTMwMiAyMDEuNjA3LC05Mi44NDA0IDIxNC44NjgsLTEwMi43
NTUiLz4KPHBvbHlnb24gZmlsbD0iaW5kaWdvIiBzdHJva2U9ImluZGlnbyIgcG9pbnRzPSIy
MTMuMzg2LC0xMDUuMTUzIDIyMS4zOTQsLTEwNy45MzEgMjE2Ljg2NiwtMTAwLjc2NSAyMTMu
Mzg2LC0xMDUuMTUzIi8+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjE4OS43MzIi
IHk9Ii05MC44NiIgZm9udC1mYW1pbHk9IlRpbWVzLHNlcmlmIiBmb250LXNpemU9IjguMDAi
IGZpbGw9ImluZGlnbyI+aGI8L3RleHQ+CjwvZz4KPCEtLSBwcm9jMl9sYWJlbF9ub2RlIC0t
Pgo8ZyBpZD0ibm9kZTYiIGNsYXNzPSJub2RlIj48dGl0bGU+cHJvYzJfbGFiZWxfbm9kZTwv
dGl0bGU+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjIyOCIgeT0iLTE0Ni44IiBm
b250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+VGhyZWFkIDI8L3Rl
eHQ+CjwvZz4KPCEtLSBlaWlkMTQgLS0+CjxnIGlkPSJub2RlOCIgY2xhc3M9Im5vZGUiPjx0
aXRsZT5laWlkMTQ8L3RpdGxlPgo8dGV4dCB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB4PSIyMjgi
IHk9Ii02MC40IiBmb250LWZhbWlseT0iVGltZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+
bzogRltybWJdPC90ZXh0Pgo8L2c+CjwhLS0gZWlpZDMmIzQ1OyZndDtlaWlkMTQgLS0+Cjxn
IGlkPSJlZGdlMSIgY2xhc3M9ImVkZ2UiPjx0aXRsZT5laWlkMyYjNDU7Jmd0O2VpaWQxNDwv
dGl0bGU+CjxwYXRoIGZpbGw9Im5vbmUiIHN0cm9rZT0iYmxhY2siIGQ9Ik0yMjgsLTEwNy44
ODNDMjI4LC0xMDAuMjU1IDIyOCwtODkuMDY0NSAyMjgsLTc5Ljc0MDgiLz4KPHBvbHlnb24g
ZmlsbD0iYmxhY2siIHN0cm9rZT0iYmxhY2siIHBvaW50cz0iMjMwLjgsLTc5LjU1MSAyMjgs
LTcxLjU1MTEgMjI1LjIsLTc5LjU1MTEgMjMwLjgsLTc5LjU1MSIvPgo8dGV4dCB0ZXh0LWFu
Y2hvcj0ibWlkZGxlIiB4PSIyMjQiIHk9Ii05Mi4xOTcyIiBmb250LWZhbWlseT0iVGltZXMs
c2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+cG88L3RleHQ+CjwvZz4KPCEtLSBlaWlkNCAtLT4K
PGcgaWQ9Im5vZGU5IiBjbGFzcz0ibm9kZSI+PHRpdGxlPmVpaWQ0PC90aXRsZT4KPHRleHQg
dGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMjI4IiB5PSItNi40IiBmb250LWZhbWlseT0iVGlt
ZXMsc2VyaWYiIGZvbnQtc2l6ZT0iOC4wMCI+ZTogUltvbmNlXVt4XT0wPC90ZXh0Pgo8L2c+
CjwhLS0gZWlpZDE0JiM0NTsmZ3Q7ZWlpZDQgLS0+CjxnIGlkPSJlZGdlMiIgY2xhc3M9ImVk
Z2UiPjx0aXRsZT5laWlkMTQmIzQ1OyZndDtlaWlkNDwvdGl0bGU+CjxwYXRoIGZpbGw9Im5v
bmUiIHN0cm9rZT0iYmxhY2siIGQ9Ik0yMjgsLTUzLjg4M0MyMjgsLTQ2LjI1NTQgMjI4LC0z
NS4wNjQ1IDIyOCwtMjUuNzQwOCIvPgo8cG9seWdvbiBmaWxsPSJibGFjayIgc3Ryb2tlPSJi
bGFjayIgcG9pbnRzPSIyMzAuOCwtMjUuNTUxIDIyOCwtMTcuNTUxMSAyMjUuMiwtMjUuNTUx
MSAyMzAuOCwtMjUuNTUxIi8+Cjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjIyNCIg
eT0iLTM4LjE5NzIiIGZvbnQtZmFtaWx5PSJUaW1lcyxzZXJpZiIgZm9udC1zaXplPSI4LjAw
Ij5wbzwvdGV4dD4KPC9nPgo8IS0tIGVpaWQ0JiM0NTsmZ3Q7ZWlpZDAgLS0+CjxnIGlkPSJl
ZGdlOSIgY2xhc3M9ImVkZ2UiPjx0aXRsZT5laWlkNCYjNDU7Jmd0O2VpaWQwPC90aXRsZT4K
PHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSIjZmZhMDQwIiBkPSJNMjEzLjU3NCwtMTcuNDU1
NUMxODEuOTc3LC0zNi40MTM3IDEwNi41MjEsLTgxLjY4NzEgNjkuMzg2MywtMTAzLjk2OCIv
Pgo8cG9seWdvbiBmaWxsPSIjZmZhMDQwIiBzdHJva2U9IiNmZmEwNDAiIHBvaW50cz0iNjcu
OTEzOSwtMTAxLjU4NiA2Mi40OTQ2LC0xMDguMTAzIDcwLjc5NTEsLTEwNi4zODggNjcuOTEz
OSwtMTAxLjU4NiIvPgo8dGV4dCB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB4PSIyMDguOTExIiB5
PSItMTkuODU1NSIgZm9udC1mYW1pbHk9IlRpbWVzLHNlcmlmIiBmb250LXNpemU9IjguMDAi
IGZpbGw9IiNmZmEwNDAiPmZyICYjMTYwOzwvdGV4dD4KPC9nPgo8IS0tIGVpaWQ0JiM0NTsm
Z3Q7ZWlpZDMgLS0+CjxnIGlkPSJlZGdlOCIgY2xhc3M9ImVkZ2UiPjx0aXRsZT5laWlkNCYj
NDU7Jmd0O2VpaWQzPC90aXRsZT4KPHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSJpbmRpZ28i
IGQ9Ik0yMjgsLTI1LjkxODFDMjI4LC00OS4yOTQyIDIyOCwtOTAuMzI5MSAyMjgsLTEwOC4x
NDIiLz4KPHBvbHlnb24gZmlsbD0iaW5kaWdvIiBzdHJva2U9ImluZGlnbyIgcG9pbnRzPSIy
MzAuOCwtMjUuNjM4MSAyMjgsLTE3LjYzODEgMjI1LjIsLTI1LjYzODEgMjMwLjgsLTI1LjYz
ODEiLz4KPHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMjI0IiB5PSItNTUuMzg5MiIg
Zm9udC1mYW1pbHk9IlRpbWVzLHNlcmlmIiBmb250LXNpemU9IjguMDAiIGZpbGw9ImluZGln
byI+aGI8L3RleHQ+CjwvZz4KPC9nPgo8L3N2Zz4K

--------------0UPL7PMVVTC5OH9BJjovEe00--
