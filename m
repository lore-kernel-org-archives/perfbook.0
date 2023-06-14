Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjFNAPg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 13 Jun 2023 20:15:36 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FAB10EC
        for <perfbook@vger.kernel.org>; Tue, 13 Jun 2023 17:15:31 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-56cf916aaa2so1496157b3.3
        for <perfbook@vger.kernel.org>; Tue, 13 Jun 2023 17:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686701730; x=1689293730;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xinGK8cZV5gWgpmnowjCP93AY6gfTm7hD4Lm+3FVyBA=;
        b=Fjz8DkpPcS0Hoe+3rvsMj2iCwLdboE8DteAHVTzNYnDgEAE8jo5pyly3OuMthUaBWt
         kJgqivk1CEUUdBcnb3L4hihbkSuiaVN5HvlYxvGFWAMpzEBDpfkVLCK6wdDtnpECDEHv
         Zx55eCmsnuQIXVF7S60eH9jQnT7dYAqLabzQYmHuEpg+8jdrGVW4WWV4QeCUMq5TPH81
         maEo3rrvZLCw2PPerl3bJvvJl4dqpeqRtVspHGQkXC54INxN4IbILlhajQQxWQDkViDv
         917Mo76g1htodekKLG2Xnb2tpmUEpgwqTnoIDZw2bSq0hQS+9sX2Y5NgRJwr5Drxkg8/
         IRAQ==
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
        by smtp.gmail.com with ESMTPSA id c123-20020a0dda81000000b0056d0709e0besm2187740ywe.129.2023.06.13.17.15.28
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 17:15:29 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
        by vps.qemfd.net (Postfix) with ESMTP id 237C22B69A
        for <perfbook@vger.kernel.org>; Tue, 13 Jun 2023 20:15:28 -0400 (EDT)
Date: Tue, 13 Jun 2023 20:15:28 -0400
From: nick black <dankamongmen@gmail.com>
Subject: 3.2.2: "lock requires two atomic ops"
Message-ID: <20230614001528.GA3365842@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bqbq4hrRfX2GGxSO"
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org


--Bqbq4hrRfX2GGxSO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

enjoying the updated edition!

"The lock operation is more expensive than CAS because it
 requires two atomic operations on the lock data structure, one
 for acquisition and the other for release."

this might be worth expanding upon. it's not immediately obvious
to me why the unlock would need to be atomic. the rough 2x
certainly jives with this explanation, and i intend to go look
at some source, but i'd think it would be more:

  atomic update
  fence
  non-atomic update

you've presumably got threads attempting to lock with a CAS
looking for a sentinel representing unlocked, right? so if i
update back to that sentinel in multiple steps, they're going to
miss in media res, no?

feel no obligation to respond, of course.

--nick

--=20
nick black -=3D- https://www.nick-black.com
to make an apple pie from scratch,
you need first invent a universe.

--Bqbq4hrRfX2GGxSO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEmi//dHmU4oe+xCLxX0NADCHL+swFAmSJBp8ACgkQX0NADCHL
+syMDw/9G6OoM2yBZ9d5akKacfPs9j016L1TUW/WhmmFgMo+sP5CqPFcccEEwljM
/x+klKks/Brl+E2s0H9jv/VAy+4pBbfnEuhjZyLqPWW4snYteqylXlTAwM5KOVjA
plOoiwk06Sm+OwHMzCMYeTXi92tixYPUMlrw6DFOrNTDQecyl5uJ4JCP7nf3RBYa
sYCDqfUpfo6WkQDgP57a+jKYUPyKnKWK9CQAhk2f8p1c+RcjxE8YX4LjMN3znGpC
SYNIgOr9uqrEA2mwE1XNZKzJYVn0c1Snr+cO9AgqSubuyqDHuqtwP6zCQnhKipwP
QqLfhNVnh3BY0nrFe2i08a0dFIVUhCTdVFlakf9AQCYsxBPtQTrrJMI6p+8ma2pU
u0IKp3gVQ1XM+4iMsVnE81b5yt9wgGJuAGCB7D392vz0tA6DtqajvgRY07tXnNLh
A4hZKO6sIvw64tWMf1QiltQWCpIdpvn/bh8eZOIndNiUXf9nr+BG+8Qrk/cOGJxH
hVeeOXunqWOCqPMWjDo8tAqVhdDOyyH1uexB+Wlshgv8JftzkmZAp4fGa6pTH/RW
OHWxkKVrBhWFWvF6xXZMHJcWPKrRN2PlIq/FjKVdGTWKhgCb7kfzPqPEvPiW/I02
dxlOYwAj+cdIrouN50OjdvXyzFdymD2b+f52Z9Fq9tWrUMS1XsM=
=WFau
-----END PGP SIGNATURE-----

--Bqbq4hrRfX2GGxSO--
