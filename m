Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4bQGWTr3b6eJS6n3t+uInAdlim2P7ir4aeHLKAz7SRk=;
 b=rLnxEWSttQk0kdqRWCHt9XswzPYpL8xVnuKupQvaABuTVWTsq+VCl1bWp3GH5EDaf8
 IZOSJCyEzbFmbCo408z4wlveHaMP9NJbmV41+kKwcpkRKvwe9IzuwcYnPAnzrrRo9Dxi
 1m6mMuriNLOFpM6adaj2qjGl9rwE4ZVsiemIW85DlblALnkHuHrB0CYOdXTKTBf0NtkC
 75yOc0bo+ZK4oHp5tPzgDvWdPXd5gQslk3y559eZ+dO0/nL4yTlGQuG2f5ltni/3u7c2
 AtAX83M8xZBdCJe0oAdme1CwDLVIKqWf93PADcZYLGm5P+NcJbpQO6FWc7H++u4dsjNX
 PCng==
Subject: Re: function smp_read_barrier_depends() confuses me
References: <381e5a1a-6550-fedb-5d04-cf6d8fe3fe3b@gmail.com>
 <20170213193415.GM30506@linux.vnet.ibm.com>
 <877c50ab-9315-7a96-7c99-b1c33a1fbb7b@gmail.com>
 <20170216184325.GI30506@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <a498df9e-0392-657c-f86b-c8829e5689ff@gmail.com>
Date: Fri, 17 Feb 2017 17:24:45 +0800
MIME-Version: 1.0
In-Reply-To: <20170216184325.GI30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On 2017年02月17日 02:43, Paul E. McKenney wrote:
> On Tue, Feb 14, 2017 at 06:31:35PM +0800, Yubin Ruan wrote:
>> Thanks for your response,
>>
>> On 2017/2/14 3:34, Paul E. McKenney wrote:
>>> On Mon, Feb 13, 2017 at 09:11:26PM +0800, Yubin Ruan wrote:
>>>> I have just finished Appendix B of perfbook(2017.01.02a), but the
>>>> function smp_read_barrier_depends() and how it make the code below
>>>> correct really confused me.
>>>>
>>>> In B.7, paragraph 2, it say:
>>>>
>>>> (1)  "Yes, this does mean that Alpha can in effect fetch the data
>>>> pointed to before it fetches the pointer itself,..."
>>>>
>>>> and after presenting the code example:
>>>>
>>>> 1  struct el *insert(long key, long data)
>>>> 2  {
>>>> 3     struct el *p;
>>>> 4     p = kmalloc(sizeof(*p), GFP_ATOMIC);
>>>> 5     spin_lock(&mutex);
>>>> 6     p->next = head.next;
>>>> 7     p->key = key;
>>>> 8     p->data = data;
>>>> 9     smp_wmb();
>>>> 10    head.next = p;
>>>> 11    spin_unlock(&mutex);
>>>> 12 }
>>>> 13
>>>> 14 struct el *search(long key)
>>>> 15 {
>>>> 16    struct el *p;
>>>> 17    p = head.next;
>>>> 18    while (p != &head) {
>>>> 19        /* BUG ON ALPHA!!! */
>>>> 20        if (p->key == key) {
>>>> 21            return (p);
>>>> 22        }
>>>> 23        p = p->next;
>>>> 24    };
>>>> 25    return (NULL);
>>>> 26 }
>>>>
>>>> it says:
>>>>
>>>> (2) "On Alpha, the smp_wmb() will guarantee that the cache
>>>> invalidates performed by lines 6-8 will reach the interconnect
>>>> before that of line 10 does, but make absolutely no guarantee about
>>>> the order in which the new values will reach the reading CPU's core"
>>>>
>>>> My question is, how exactly does this code break on Alpha and how
>>>> the smp_read_barrier_depends() help make it correct, as follow:
>>>>
>>>> 18    while (p != &head) {
>>>> 19        smp_read_barrier_depends();
>>>> 20        if (p->key == key) {
>>>> 21            return (p);
>>>>
>>>> According to (2), I guess that the code breaks because the "new
>>>> values" arrive in reading CPU in disorder, even though "cache
>>>> invalidation messages" arrive in order. That says, in Figure B.10,
>>>> even though the reading CPU core get invalidation message of
>>>>   p->next
>>>>   p->key
>>>>   p->data
>>>> before invalidation message of `head.next', it might not get the value of
>>>>   p->next
>>>>   p->key
>>>>   p->data
>>>> before `head.next', which resulting in code break. Is that correct ?
>>
>> So, is this speculation correct or do I miss anything?
>
> Looks accurate to me!
>
>>>> The whole paragraphs do not refer to any exact line of code so I
>>>> really confusing.
>>>>
>>>> And, if that is correct, can I infer that all other CPUs except
>>>> Alpha would guarantee that "new values" and "cache invalidation
>>>> messages" would arrive in reading CPU in order, with proper memory
>>>> barriers like that at line 9 ?
>>>>
>>>> Frankly, I consider the some narratives in Appendix B pretty
>>>> confusing(no offense):
>>>>
>>>> 1. At paragraph 4 in page 350 of the two-column
>>>> perfbook.2017.01.02a, it says:
>>>>
>>>>    "Figure B.10 shows how ... Assume that the list header `head'
>>>> will be processed by cache bank 0, and that the new element will be
>>>> processed by cache bank 1 ... For example, it is possible that
>>>> reading CPU's cache bank 1 is very busy, but cache bank 0 is
>>>> idle..."
>>>>
>>>>  As there are bank 0 and bank 1 in both the writing CPU and the
>>>> reading CPU, it is hard to infer which cache bank 0 is processing
>>>> the header `head' and which cache bank 1 is processing the new
>>>> element, and as a result I don't know how that disorder happen.
>>>>
>>>> 2. In figure B.10, both CPU have a "(r)mb Sequencing" and "(r)mb
>>>> Sequencing", but not all of this are necessary. So, what do those
>>>> sequencing mean ?
>>>>
>>>> I have read the mail at
>>>>    http://h41379.www4.hpe.com/wizard/wiz_2637.html
>>>> but cannot find anything directly related to Alpha's weird feature.
>>>> Can anyone provide any hint?(which paragraph...)
>>>
>>> Here you go:
>>>
>>> 	For instance, your producer must issue a "memory barrier"
>>> 	instruction after writing the data to shared memory and before
>>> 	inserting it on the queue; likewise, your consumer must issue a
>>> 	memory barrier instruction after removing an item from the queue
>>> 	and before reading from its memory.  Otherwise, you risk seeing
>>> 	stale data, since, while the Alpha processor does provide coherent
>>> 	memory, it does not provide implicit ordering of reads and writes.
>>> 	(That is, the write of the producer's data might reach memory
>>> 	after the write of the queue, such that the consumer might read
>>> 	the new item from the queue but get the previous values from
>>> 	the item's memory.
>>>
>>> This is not as explicit as would be good, but note the __PAL_INSQ
>>> and __PAL_REMQ() in the question.
>>
>> Thanks for your hint. I have noticed that the question said
>>     "use the memory to allocate hardware queue data structures
>> (supported by the __PAL_INSQ... and __PAL_REMQ... built-ins in DEC
>> C++)"
>>
>> So, can I infer that this "hardware queue data structures" is
>> something similar to the "invalidate queue" in Appendix B of the
>> perfbook?
>>
>> I have read those paragraphs in the perfbook and the thread on
>>     http://h41379.www4.hpe.com/wizard/wiz_2637.html
>> several times, and now I think I can conclude:
>>
>>     Although the invalidation messages of `p->key', `p->data' are
>> guaranteed to reach the interconnect(by invalidate queue) before
>> that of `head.next', the new values are not. This way, the reading
>> CPU might see new value of `head.next' but old cached value of
>> `p->key' and `p->data'.
>>
>> Is this correct ?
>>
>> If that is correct, then I would suggest rephrase one paragraph in
>> the perfbook(paragraph 4, p350, perfbook 2017.01.02a, two columns
>> format):
>>
>>     Figure B.10 shows how this can happen on an aggressively parallel
>>     machine with partitioned caches, so that alternating cache lines
>>     are processed by the different partitions of the caches. Assume
>>     that on the reading CPU, the list header head will be processed by
>>     cache bank 0, and that the new element will be processed by cache
>>     bank 1.
>
> Actually, this would mean that the list header would be processed by
> cache bank 0 regardless of CPU.
>
>>             On Alpha, the smp_wmb() will guarantee that the cache
>>     invalidates performed by lines 6-8 of Figure B.9 will reach the
>>     interconnect before that of line 10 does, but makes absolutely no
>>     guarantee about the order in which the new values will reach the
>>     reading CPU’s core. For example, it is possible that the reading
>>     CPU’s cache bank 1 is very busy, but cache bank 0 is idle. This
>>     could result in the new values for the new elements(e.g, p->data)
>>     being delayed, so that the reading CPU gets the new value for the
>>     pointer(i.e, head.next), but sees the old cached values for the new
>>     element.
>>
>> For your convenience, I have make a diff and attach it in the
>> attachment (I apologize for its non-standard git patch format
>> because I currently working at Windows and things kind of get messed
>> up)
>
> However, I believe that I see your point, and reworked this paragraph
> as follows:
>
> 	Figure B.10 shows how this can happen on an aggressively parallel
> 	machine with partitioned caches, so that alternating cache lines
> 	are processed by the different partitions of the caches. For
> 	example, the load of head.next on line 17 of Figure B.9 might
> 	access cache bank 0, and the load of p->key on line 20 and
> 	of p->next on line 23 might access cache bank 1. On Alpha,
> 	the smp_wmb() will guarantee that the cache invalidations
> 	performed by lines 6-8 of Figure B.9 (for p->next , p->key ,
> 	and p->data ) will reach the interconnect before that of line 10
> 	(for head.next ), but makes absolutely no guarantee about the
> 	order of propagation through the reading CPU’s cache banks. For
> 	example, it is possible that the reading CPU’s cache bank 1 is
> 	very busy, but cache bank 0 is idle. This could result in the
> 	cache invalidations for the new element ( p->next , p->key ,
> 	and p->data ) being delayed, so that the reading CPU loads the
> 	new value for head.next , but loads the old cached values for
> 	p->key and p->next . See the documentation [Com01] called out
> 	earlier for more information, or, again, if you think that I am
> 	just making all this up.
>
> Does that help?

Yes. thank you!

regards,
Yubin Ruan

>
>>> I had a long discussion with the DEC Alpha architects in the late 1990s.
>>> It took them an hour to convince me that their hardware actually worked
>>> in this way.  It then took me two hours to convince them that no one
>>> reading their documentation would come to that conclusion.  ;-)
>>>
>>> Another reference is Section 5.6.1.7 and surrounding sections of the
>>> DEC Alpha reference manual:
>>>
>>> 	https://archive.org/details/dec-alpha_arch_ref
>>>
>>> Hey, you asked!!!
>>>
>>> 							Thanx, Paul
>>>
>>
>> Thank for this reference. It will take some time for me to read it.
>>
>> regards,
>> Yubin Ruan
>
>> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
>> ---
>>
>> diff --git "a/appendix/whymb/whymemorybarriers.tex" "b/appendix/whymb/whymemorybarriers.tex.new"
>> index efeb279..f527500 100644
>> --- "a/appendix/whymb/whymemorybarriers.tex"
>> +++ "b/appendix/whymb/whymemorybarriers.tex.new"
>> @@ -1764,7 +1764,8 @@ shows how this can happen on
>>  an aggressively parallel machine with partitioned caches, so that
>>  alternating cache lines are processed by the different partitions
>>  of the caches.
>> -Assume that the list header {\tt head} will be processed by cache bank~0,
>> +Assume that one the reading CPU, list header {\tt head} will be
>> +processed by cache bank~0,
>>  and that the new element will be processed by cache bank~1.
>>  On Alpha, the \co{smp_wmb()} will guarantee that the cache invalidates performed
>>  by lines~6-8 of
>> @@ -1774,8 +1775,10 @@ makes absolutely no guarantee about the order in which the new values will
>>  reach the reading CPU's core.
>>  For example, it is possible that the reading CPU's cache bank~1 is very
>>  busy, but cache bank~0 is idle.
>> -This could result in the cache invalidates for the new element being
>> -delayed, so that the reading CPU gets the new value for the pointer,
>> +This could result in the cache invalidates for the new value(e.g, {\tt p->data})
>> +being delayed,
>> +so that the reading CPU gets the new value for the
>> +pointer(e.g, {\tt head.next}),
>>  but sees the old cached values for the new element.
>>  See the documentation~\cite{Compaq01} called out earlier for more information,
>>  or, again, if you think that I am just making all this up.\footnote{
>
>

