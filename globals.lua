local _og_poll_edition = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
    if (_key == 'wheel_of_fortune' or _key == 'aura') and not _options then
        _options = { 'e_negative', 'e_polychrome', 'e_holo', 'e_foil', 'e_vtb_hyped', 'e_vtb_debut', 'e_vtb_glitched' }
    end
    return _og_poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
end
