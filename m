Return-Path: <SRS0=hA79=CI=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687227221; x=1689819221;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O7tfmNqbqW3SKuFUTGiSlU7vVgPtQqnXo0KyHBaRjSU=;
        b=HObEIb3KEGDmJpkaBhs6BLK2T+SxeTo3bXZIYAzFNe97j3wjER4gHTZTqFXPlA4t9k
         1bGeBdg6jVhcyyIrjJsQGp1fEkSKm0GcIg1n9xLprVP5PgqFrUvgv80HS3HbaEF8d4Ch
         B8BBZFW6GXFRSp/BDxFACWIPER1XnKyXQ2IJfCzI0v8syNZhFLjpHyJ+JCxpPBJHtf1j
         Fv6eAczsXBvBvBvMCyX4dEFZ55/Uh803m1fI34hR9FpwNkUSwMCd1bhhjF7Hq6BoXmL8
         uj5Tzln5cK0ErP8+WzdCcUmE+kS5jBYobzLUtw5SiBuwGPDfw1zobISMv7kK6s4mnm2G
         bNXg==
Message-ID: <e90e329664670a8b92a64970310be2ff92b41301.camel@gmail.com>
Subject: Re: [PATCH] CodeSamples/tree: Fix compiler warning on free
From: Leonardo Bras <leobras.c@gmail.com>
Date: Mon, 19 Jun 2023 23:13:32 -0300
In-Reply-To: <20230616063903.207676-3-leobras.c@gmail.com>
References: <20230616063903.207676-3-leobras.c@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hWxEdOxvY794v90n3Asq"
MIME-Version: 1.0
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--=-hWxEdOxvY794v90n3Asq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-06-16 at 03:39 -0300, Leonardo Bras wrote:
> While building the CodeSamples/datastruct/Issaquah/ directory, I can
> see
> a couple instances of this warning:
>=20
> In function =E2=80=98free_treenode_cache=E2=80=99,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98tree_remove_all=E2=80=99 at tree=
.c:102:2,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98tree_free=E2=80=99 at tree.c:128=
:2:
> tree.c:251:9: warning: =E2=80=98free=E2=80=99 called on pointer =E2=80=98=
trp=E2=80=99 with nonzero
> offset 96 [-Wfree-nonheap-object]
> =C2=A0 251 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(tnp);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~
>=20
> I took a look and tried to understand what was happening:
> - tree_remove_all() calls free_treenode_cache() on it's input, which
> ends
> =C2=A0 up free()'ing it (!BAD_MALLOC)
> - It makes sense in most treenodes, since they are allocated with
> =C2=A0 alloc_treenode_cache() and the malloc() output is the same as the
> free()
> =C2=A0 input.
> - tree_free() calls tree_remove_all() on &trp->max, which ends up
> trying
> =C2=A0 to free() this same address.
> - trp is a struct treeroot, which is composed of 2 treenodes: min &
> max
> - The output of malloc() for trp ends up being different from the
> address
> =C2=A0 used for free(), since &trp->max is used instead, and there is an
> offset
> =C2=A0 since max is the second element of struct treeroot.
>=20
> To solve this while keeping the tree_remove_all() generic, move
> struct traceroot->max to be the first element, and guarantee the
> address
> used for free() is the same returned by malloc().

Extra info:

Bug reproduction:
https://gitlab.com/linux-kernel/perfbook/-/jobs/4501216686#L212

With bugfix provided in this patch:
https://gitlab.com/linux-kernel/perfbook/-/jobs/4485986705


Thanks,
Leo

>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
> =C2=A0CodeSamples/datastruct/Issaquah/tree.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/CodeSamples/datastruct/Issaquah/tree.h
> b/CodeSamples/datastruct/Issaquah/tree.h
> index f007558a..bbe5e7c1 100644
> --- a/CodeSamples/datastruct/Issaquah/tree.h
> +++ b/CodeSamples/datastruct/Issaquah/tree.h
> @@ -48,8 +48,8 @@ struct treenode {
> =C2=A0 * Root of a tree.
> =C2=A0 */
> =C2=A0struct treeroot {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode min;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode max;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode min;
> =C2=A0} __attribute__((__aligned__(CACHE_LINE_SIZE)));
> =C2=A0
> =C2=A0void treenode_wire_call_rcu(void);


--=-hWxEdOxvY794v90n3Asq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEENubJWuDxEcxbb00uaIwz+KDFsMUFAmSRC0wACgkQaIwz+KDF
sMXS1A/8DKrcq7V4h0zPuld7puKjWt5jdqjc8CZZz9uhVxkTptsdd0VmncSAMKnh
h9G9GI3WWprSsO2qrvpzp9sCy+Cne9PTSvPnCb13hy0T6JDzMvKd30e3xSv01UdX
67Zk7mg83vjlJwjicAEhc4sXnuaedPCf7GgVN9wIkJJAAA4HYYuF9vcIexJxi7ou
K1jGRo46HTLhQlKDCHy1+8oObKvnNzf1XzfLN4G7BTxYchmShawKN3ScUfMqKkY7
9I54g7DO6RQi/O5vs/exLUPaWwC5F6VNaGm5GEoeenAUBh3wdsAODqTJgAdnhDZj
pQ1IqtC7uePAirSN8uY+ZAa4kpQDJbIev/vfFUbewmHWfWSSUFrBmtRvdM1Xz70o
d3cUVVJnOdffxNNyGTBxLbZ3r6zq0W1D+5wdZu3d9KnemYNHirZ5ccaq9iT0cVLC
8DSFMrfgXiiJBvfTtYtH+eCbGaUOkABwmJguWbvrPvD5/lNTLhNYzCHPDRemFTd7
9KFxYswSPkZr6prHUyGDtZhqlpjl4qNMkvH2vpn7rSYs/JX3B1+6Q/Uf1Z15wx2P
Nsepo3ebkW1pptAIjJbxa6bQrIN+7hwqzJfmKYFSCHhf6bbmRGg8qm733GYtI1kP
ax0eo6MLm8plaL5lEGoOSx72ou/+d1FmDLvt28KvuEPxzJ0VrqI=
=jkXa
-----END PGP SIGNATURE-----

--=-hWxEdOxvY794v90n3Asq--
