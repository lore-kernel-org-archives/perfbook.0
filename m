Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40140 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752285AbdBMTeQ (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 14:34:16 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1DJXwx0083705
 for <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 14:34:16 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28ke4untxm-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 13 Feb 2017 14:34:16 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 13 Feb
 2017 12:34:14 -0700
Date: Mon, 13 Feb 2017 11:34:15 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: function smp_read_barrier_depends() confuses me
Reply-To: paulmck@linux.vnet.ibm.com
References: <381e5a1a-6550-fedb-5d04-cf6d8fe3fe3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <381e5a1a-6550-fedb-5d04-cf6d8fe3fe3b@gmail.com>
Message-Id: <20170213193415.GM30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 13, 2017 at 09:11:26PM +0800, Yubin Ruan wrote:
> I have just finished Appendix B of perfbook(2017.01.02a), but the
> function smp_read_barrier_depends() and how it make the code below
> correct really confused me.
> 
> In B.7, paragraph 2, it say:
> 
> (1)  "Yes, this does mean that Alpha can in effect fetch the data
> pointed to before it fetches the pointer itself,..."
> 
> and after presenting the code example:
> 
> 1  struct el *insert(long key, long data)
> 2  {
> 3     struct el *p;
> 4     p = kmalloc(sizeof(*p), GFP_ATOMIC);
> 5     spin_lock(&mutex);
> 6     p->next = head.next;
> 7     p->key = key;
> 8     p->data = data;
> 9     smp_wmb();
> 10    head.next = p;
> 11    spin_unlock(&mutex);
> 12 }
> 13
> 14 struct el *search(long key)
> 15 {
> 16    struct el *p;
> 17    p = head.next;
> 18    while (p != &head) {
> 19        /* BUG ON ALPHA!!! */
> 20        if (p->key == key) {
> 21            return (p);
> 22        }
> 23        p = p->next;
> 24    };
> 25    return (NULL);
> 26 }
> 
> it says:
> 
> (2) "On Alpha, the smp_wmb() will guarantee that the cache
> invalidates performed by lines 6-8 will reach the interconnect
> before that of line 10 does, but make absolutely no guarantee about
> the order in which the new values will reach the reading CPU's core"
> 
> My question is, how exactly does this code break on Alpha and how
> the smp_read_barrier_depends() help make it correct, as follow:
> 
> 18    while (p != &head) {
> 19        smp_read_barrier_depends();
> 20        if (p->key == key) {
> 21            return (p);
> 
> According to (2), I guess that the code breaks because the "new
> values" arrive in reading CPU in disorder, even though "cache
> invalidation messages" arrive in order. That says, in Figure B.10,
> even though the reading CPU core get invalidation message of
>    p->next
>    p->key
>    p->data
> before invalidation message of `head.next', it might not get the value of
>    p->next
>    p->key
>    p->data
> before `head.next', which resulting in code break. Is that correct ?
> The whole paragraphs do not refer to any exact line of code so I
> really confusing.
> 
> And, if that is correct, can I infer that all other CPUs except
> Alpha would guarantee that "new values" and "cache invalidation
> messages" would arrive in reading CPU in order, with proper memory
> barriers like that at line 9 ?
> 
> Frankly, I consider the some narratives in Appendix B pretty
> confusing(no offense):
> 
> 1. At paragraph 4 in page 350 of the two-column
> perfbook.2017.01.02a, it says:
> 
>     "Figure B.10 shows how ... Assume that the list header `head'
> will be processed by cache bank 0, and that the new element will be
> processed by cache bank 1 ... For example, it is possible that
> reading CPU's cache bank 1 is very busy, but cache bank 0 is
> idle..."
> 
>   As there are bank 0 and bank 1 in both the writing CPU and the
> reading CPU, it is hard to infer which cache bank 0 is processing
> the header `head' and which cache bank 1 is processing the new
> element, and as a result I don't know how that disorder happen.
> 
> 2. In figure B.10, both CPU have a "(r)mb Sequencing" and "(r)mb
> Sequencing", but not all of this are necessary. So, what do those
> sequencing mean ?
> 
> I have read the mail at
>     http://h41379.www4.hpe.com/wizard/wiz_2637.html
> but cannot find anything directly related to Alpha's weird feature.
> Can anyone provide any hint?(which paragraph...)

Here you go:

	For instance, your producer must issue a "memory barrier"
	instruction after writing the data to shared memory and before
	inserting it on the queue; likewise, your consumer must issue a
	memory barrier instruction after removing an item from the queue
	and before reading from its memory.  Otherwise, you risk seeing
	stale data, since, while the Alpha processor does provide coherent
	memory, it does not provide implicit ordering of reads and writes.
	(That is, the write of the producer's data might reach memory
	after the write of the queue, such that the consumer might read
	the new item from the queue but get the previous values from
	the item's memory.

This is not as explicit as would be good, but note the __PAL_INSQ
and __PAL_REMQ() in the question.

I had a long discussion with the DEC Alpha architects in the late 1990s.
It took them an hour to convince me that their hardware actually worked
in this way.  It then took me two hours to convince them that no one
reading their documentation would come to that conclusion.  ;-)

Another reference is Section 5.6.1.7 and surrounding sections of the
DEC Alpha reference manual:

	https://archive.org/details/dec-alpha_arch_ref

Hey, you asked!!!

							Thanx, Paul

